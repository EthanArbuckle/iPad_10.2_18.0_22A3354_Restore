@implementation IMItemsController

- (void)setCapacity:(unint64_t)a3
{
  if (self->_capacity != a3)
  {
    self->_capacity = a3;
    if (-[IMItemsController _trimIfNeeded](self, "_trimIfNeeded"))
      -[IMItemsController _itemsDidChange:](self, "_itemsDidChange:", self->_items);
  }
}

- (BOOL)_trimIfNeeded
{
  __CFArray *items;
  unint64_t Count;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  CFRange v15;

  v14 = *MEMORY[0x1E0C80C00];
  items = self->_items;
  Count = CFArrayGetCount(items);
  v5 = self->_capacity + 5;
  if (Count > v5)
  {
    v15.location = 0;
    v15.length = Count - v5;
    CFArrayReplaceValues(items, v15, 0, 0);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", Count);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "We are trimming items as our count (count: %@) is over the maxCapacity (maxCapacity: %@)", (uint8_t *)&v10, 0x16u);

      }
    }
  }
  return Count > v5;
}

- (NSArray)_items
{
  return (NSArray *)self->_items;
}

- (id)_lastFinishedMessage
{
  __CFArray *items;
  CFIndex Count;
  CFIndex v4;
  void *v5;

  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_8:
    v5 = 0;
  }
  else
  {
    v4 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v5, "isTypingMessage") & 1) == 0
        && (objc_msgSend(v5, "isSuggestedActionResponse") & 1) == 0
        && (objc_msgSend(v5, "isLastMessageCandidate") & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1)
        goto LABEL_8;
    }
  }
  return v5;
}

- (id)_initWithItems:(id)a3
{
  const __CFArray *v4;
  IMItemsController *v5;
  const __CFArray *MutableCopy;
  objc_super v8;

  v4 = (const __CFArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)IMItemsController;
  v5 = -[IMItemsController init](&v8, sel_init);
  if (v5)
  {
    if (v4)
      MutableCopy = CFArrayCreateMutableCopy(0, 0, v4);
    else
      MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v5->_items = MutableCopy;
    v5->_capacity = CFArrayGetCount(MutableCopy);
    -[IMItemsController assignSortIDsToItems:](v5, "assignSortIDsToItems:", v4);
  }

  return v5;
}

- (void)assignSortIDsToItems:(id)a3 shouldRecalculateSortIDForAllMessages:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count") != 1)
  {
    v8 = v6;
    v9 = v8;
    v19 = v6;
    if (v4)
    {
      objc_msgSend(v8, "sortedArrayUsingComparator:", &unk_1E471D578);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v12)
    {
LABEL_20:

      v6 = v19;
      goto LABEL_21;
    }
    v13 = v12;
    v14 = *(_QWORD *)v21;
    v15 = 1;
LABEL_7:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
      v18 = 0;
      if (-[IMItemsController _shouldPinUnsentMessagesToBottom](self, "_shouldPinUnsentMessagesToBottom") && !v4)
        v18 = objc_msgSend(v17, "unsentIsFromMeItem");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (((objc_msgSend(v17, "isTypingMessage") | v18) & 1) != 0)
          goto LABEL_17;
      }
      else if (v18)
      {
LABEL_17:
        objc_msgSend(v17, "setSortID:", 0);
        goto LABEL_18;
      }
      objc_msgSend(v17, "setSortID:", v15++);
LABEL_18:
      if (v13 == ++v16)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (!v13)
          goto LABEL_20;
        goto LABEL_7;
      }
    }
  }
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortID:", 1);

LABEL_21:
}

- (void)assignSortIDsToItems:(id)a3
{
  -[IMItemsController assignSortIDsToItems:shouldRecalculateSortIDForAllMessages:](self, "assignSortIDsToItems:shouldRecalculateSortIDForAllMessages:", a3, 1);
}

- (id)_lastMessage
{
  __CFArray *items;
  CFIndex Count;
  CFIndex v4;
  void *v5;

  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_6:
    v5 = 0;
  }
  else
  {
    v4 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "isLastMessageCandidate") & 1) != 0)
        break;

      if ((unint64_t)--v4 <= 1)
        goto LABEL_6;
    }
  }
  return v5;
}

- (id)_lastIncomingFinishedMessage
{
  __CFArray *items;
  CFIndex Count;
  CFIndex v4;
  void *v5;

  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_8:
    v5 = 0;
  }
  else
  {
    v4 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v5, "isFromMe") & 1) == 0
        && (objc_msgSend(v5, "isTypingMessage") & 1) == 0
        && (objc_msgSend(v5, "isLastMessageCandidate") & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1)
        goto LABEL_8;
    }
  }
  return v5;
}

- (IMItemsController)init
{
  return (IMItemsController *)MEMORY[0x1E0DE7D20](self, sel__initWithItems_);
}

- (void)dealloc
{
  __CFArray *items;
  objc_super v4;

  items = self->_items;
  if (items)
    CFRelease(items);
  v4.receiver = self;
  v4.super_class = (Class)IMItemsController;
  -[IMItemsController dealloc](&v4, sel_dealloc);
}

- (BOOL)isMoreToLoad
{
  unint64_t capacity;

  capacity = self->_capacity;
  return capacity <= CFArrayGetCount(self->_items);
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4
{
  -[IMItemsController _handleItem:forChatStyle:keepExistingIndex:](self, "_handleItem:forChatStyle:keepExistingIndex:", a3, a4, 0);
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 keepExistingIndex:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  __CFArray *items;
  void *v9;
  BOOL v10;
  char v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  id v27;

  v5 = a5;
  v7 = a3;
  items = self->_items;
  _IMItemsControllerGetTypingMessage(items);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  objc_opt_class();
  v10 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v27, "associatedMessageType") == 3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v27, "hasEditedParts");
  else
    v11 = 0;
  _IMItemsControllerHandleItem(self, items, v27, v10 | v11, 1, v5);
  _IMItemsControllerGetTypingMessage(items);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v12)
  {
    if (v9)
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__replaceStaleTypingMessage, 0);
    if (v12)
    {
      v13 = _IMTypingMessageTimeout();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
      v16 = v15;
      objc_msgSend(v12, "time");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v19 = v13 - (v16 - v18) + 1.0;
      v20 = 0.0;
      if (v19 >= 0.0)
      {
        v21 = _IMTypingMessageTimeout();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceReferenceDate");
        v24 = v23;
        objc_msgSend(v12, "time");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSinceReferenceDate");
        v20 = v21 - (v24 - v26) + 1.0;

      }
      -[IMItemsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__replaceStaleTypingMessage, 0, v20);
    }
  }
  -[IMItemsController _itemsDidChange:](self, "_itemsDidChange:", items);

}

- (void)_removeItem:(id)a3
{
  __CFArray *items;
  CFIndex v5;

  items = self->_items;
  v5 = _IMItemsControllerIndexOfExistingItem(items, a3, 0);
  if (v5 != -1)
  {
    CFArrayRemoveValueAtIndex(items, v5);
    -[IMItemsController _itemsDidChange:](self, "_itemsDidChange:", items);
  }
}

- (void)_replaceItems:(id)a3
{
  __CFArray *items;
  unint64_t capacity;
  uint64_t v6;
  id v7;

  v7 = a3;
  items = self->_items;
  _IMItemsControllerReplaceItems(self, items, v7);
  capacity = self->_capacity;
  if (capacity <= objc_msgSend(v7, "count"))
    v6 = objc_msgSend(v7, "count");
  else
    v6 = self->_capacity;
  self->_capacity = v6;
  -[IMItemsController assignSortIDsToItems:](self, "assignSortIDsToItems:", items);
  -[IMItemsController _itemsDidChange:](self, "_itemsDidChange:", items);

}

- (void)_replaceAndSortItemsWithUnsortedItems:(id)a3
{
  const __CFArray *v4;

  v4 = (const __CFArray *)objc_msgSend(a3, "mutableCopy");
  if ((unint64_t)-[__CFArray count](v4, "count") >= 2)
    _IMItemsControllerSortItems(v4);
  -[IMItemsController _replaceItems:](self, "_replaceItems:", v4);

}

- (void)_removeAllItems
{
  __CFArray *items;

  items = self->_items;
  CFArrayRemoveAllValues(items);
  -[IMItemsController _itemsDidChange:](self, "_itemsDidChange:", items);
}

- (void)_replaceStaleTypingMessage
{
  __CFArray *items;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  items = self->_items;
  _IMItemsControllerGetTypingMessage(items);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = 138412290;
        v7 = v4;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Replacing stale typing indicator: %@)", (uint8_t *)&v6, 0xCu);
      }

    }
    _IMItemsControllerHandleItem(self, items, v4, 0, 0, 0);
    -[IMItemsController _itemsDidChange:](self, "_itemsDidChange:", items);
  }

}

- (void)_resortItems
{
  CFIndex Count;
  const __CFArray *MutableCopy;

  Count = CFArrayGetCount(self->_items);
  MutableCopy = CFArrayCreateMutableCopy(0, Count, self->_items);
  _IMItemsControllerSortItems(MutableCopy);
  -[IMItemsController _replaceItems:](self, "_replaceItems:", MutableCopy);
  CFRelease(MutableCopy);
}

- (void)_setSortID:(id)a3
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  __CFString *v34;
  id v35;
  int v36;
  const __CFString *v37;
  int v38;
  id v40;
  __CFString *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  -[IMItemsController _items](self, "_items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[__CFString isTypingMessage](v41, "isTypingMessage"))
    v38 = -[__CFString isFromMe](v41, "isFromMe") ^ 1;
  else
    v38 = 0;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0
    && (-[__CFString isTypingMessage](v41, "isTypingMessage") & 1) == 0
    && -[__CFString sortID](v41, "sortID") == 0;
  if ((v38 | v4) == 1
    && !-[IMItemsController _shouldPinUnsentMessagesToBottom](self, "_shouldPinUnsentMessagesToBottom"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("NO");
        if (v38)
          v7 = CFSTR("YES");
        else
          v7 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v53 = v7;
        v54 = 2112;
        if (v4)
          v6 = CFSTR("YES");
        v55 = (uint64_t)v6;
        v56 = 2112;
        v57 = v41;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Setting the sort ID from item before the last item -- lastItemIsTypingMessage %@ lastItemIsErrorCase %@ Last item %@", buf, 0x20u);
      }

    }
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "*** ---- Trying to fix a bad sort ID -- Printing All Items -- Please file a radar ---- ***", buf, 2u);
        }

      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[IMItemsController _items](self, "_items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v47 != v11)
              objc_enumerationMutation(v9);
            v13 = *(const __CFString **)(*((_QWORD *)&v46 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v53 = v13;
                _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "\t\t%@", buf, 0xCu);
              }

            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v10);
      }

    }
    -[IMItemsController _items](self, "_items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v17 = v16 >= 2;
    v18 = v16 - 2;
    if (v17)
    {
      -[IMItemsController _items](self, "_items");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", v18);
      v20 = objc_claimAutoreleasedReturnValue();

      v41 = (__CFString *)v20;
    }
  }
  if (-[IMItemsController _shouldPinUnsentMessagesToBottom](self, "_shouldPinUnsentMessagesToBottom"))
  {
    if ((objc_msgSend(v40, "unsentIsFromMeItem") & 1) != 0)
      goto LABEL_55;
    v21 = -[__CFString sortID](v41, "sortID");
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[IMItemsController _items](self, "_items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reverseObjectEnumerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v43;
      while (2)
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          if (objc_msgSend(v27, "sortID"))
          {
            v21 = objc_msgSend(v27, "sortID");
            goto LABEL_53;
          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v24)
          continue;
        break;
      }
    }
LABEL_53:

  }
  else
  {
    v21 = -[__CFString sortID](v41, "sortID");
  }
  objc_msgSend(v40, "setSortID:", v21 + 1);
LABEL_55:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFString sortID](v41, "sortID"));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString guid](v41, "guid");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v53 = v29;
      v54 = 2112;
      if (v38)
        v32 = CFSTR("YES");
      v55 = v30;
      v56 = 2112;
      v57 = v32;
      _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "last item's sortID %@ guid %@ isTyping %@", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v40, "sortID"));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "guid");
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v40, "unsentIsFromMeItem");
      v37 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v53 = v34;
      v54 = 2112;
      if (v36)
        v37 = CFSTR("YES");
      v55 = (uint64_t)v35;
      v56 = 2112;
      v57 = v37;
      _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "set sortID %@ guid %@ itemIsUnsentAndFromMe %@", buf, 0x20u);

    }
  }

}

- (unint64_t)_indexOfItem:(id)a3
{
  unint64_t result;

  result = _IMItemsControllerIndexOfExistingItem(self->_items, a3, 0);
  if (result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)_itemForGUID:(id)a3
{
  id v4;
  __CFArray *items;
  CFIndex Count;
  CFIndex v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v7 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v7 - 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
        break;

      if ((unint64_t)--v7 <= 1)
        goto LABEL_5;
    }
  }

  return v8;
}

- (id)_typingMessage
{
  return _IMItemsControllerGetTypingMessage(self->_items);
}

- (id)_firstMessage
{
  __CFArray *items;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  void *v6;

  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_6:
    v6 = 0;
  }
  else
  {
    v4 = Count;
    v5 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "isFirstMessageCandidate") & 1) != 0)
        break;

      if (v4 == ++v5)
        goto LABEL_6;
    }
  }
  return v6;
}

- (id)_lastSentMessage
{
  __CFArray *items;
  CFIndex Count;
  CFIndex v4;
  void *v5;

  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_9:
    v5 = 0;
  }
  else
  {
    v4 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v5, "isTypingMessage") & 1) == 0
        && (objc_msgSend(v5, "isSuggestedActionResponse") & 1) == 0
        && objc_msgSend(v5, "isFromMe")
        && (objc_msgSend(v5, "isLastMessageCandidate") & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1)
        goto LABEL_9;
    }
  }
  return v5;
}

- (id)_lastIncomingMessage
{
  __CFArray *items;
  CFIndex Count;
  CFIndex v4;
  void *v5;

  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_7:
    v5 = 0;
  }
  else
  {
    v4 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v5, "isFromMe") & 1) == 0
        && (objc_msgSend(v5, "isLastMessageCandidate") & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1)
        goto LABEL_7;
    }
  }
  return v5;
}

+ (id)_charactersToIgnoreWhenParsingTextContent
{
  if (qword_1EE65F310 != -1)
    dispatch_once(&qword_1EE65F310, &unk_1E471C2F0);
  return (id)qword_1EE65F308;
}

- (id)_lastIncomingFinishedMessageWithTextContent
{
  __CFArray *items;
  CFIndex Count;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count >= 1)
  {
    for (i = Count + 1; i > 1; --i)
    {
      CFArrayGetValueAtIndex(items, i - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "isLastMessageCandidate"))
      {
        objc_msgSend(v5, "body");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "string");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMItemsController _charactersToIgnoreWhenParsingTextContent](IMItemsController, "_charactersToIgnoreWhenParsingTextContent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByRemovingCharactersFromSet:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v5, "isFromMe") & 1) == 0
          && (objc_msgSend(v5, "isTypingMessage") & 1) == 0
          && objc_msgSend(v9, "length"))
        {

          return v5;
        }

      }
    }
  }
  v5 = 0;
  return v5;
}

- (id)_lastRelatedIncomingFinishedMessageTextContentWithLimit:(int64_t)a3
{
  void *v4;
  __CFArray *items;
  CFIndex Count;
  void *v7;
  char v8;
  CFIndex v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v24;
  _QWORD v25[4];
  id v26;

  -[IMItemsController _lastIncomingFinishedMessageWithTextContent](self, "_lastIncomingFinishedMessageWithTextContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v20 = 0;
    goto LABEL_27;
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
    v7 = 0;
    goto LABEL_23;
  }
  v7 = 0;
  v8 = 0;
  v9 = Count + 1;
  while (1)
  {
    CFArrayGetValueAtIndex(items, v9 - 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v10, "isLastMessageCandidate"))
      goto LABEL_18;
    v11 = v7;
    objc_msgSend(v10, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMItemsController _charactersToIgnoreWhenParsingTextContent](IMItemsController, "_charactersToIgnoreWhenParsingTextContent");
    v14 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByRemovingCharactersFromSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v14;
    if (v10 == v14)
    {
      objc_msgSend(v24, "addObject:", v16);
      objc_msgSend(v14, "time");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      goto LABEL_15;
    }
    v7 = v11;
    if ((v8 & 1) == 0)
    {
      v8 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v10, "time");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v11);
    v19 = v18;
    if ((objc_msgSend(v10, "isFromMe") & 1) != 0
      || (objc_msgSend(v10, "isTypingMessage") & 1) != 0
      || !objc_msgSend(v16, "length")
      || fabs(v19) > 60.0
      || objc_msgSend(v24, "count") >= (unint64_t)a3)
    {
      break;
    }
    objc_msgSend(v24, "addObject:", v16);
LABEL_15:

    v8 = 1;
    v7 = v17;
LABEL_17:

LABEL_18:
    if ((unint64_t)--v9 <= 1)
      goto LABEL_23;
  }

LABEL_23:
  if (objc_msgSend(v24, "count"))
  {
    v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1A205EB2C;
    v25[3] = &unk_1E471F340;
    v20 = v21;
    v26 = v20;
    objc_msgSend(v24, "enumerateObjectsWithOptions:usingBlock:", 2, v25);

  }
  else
  {
    v20 = 0;
  }

LABEL_27:
  return v20;
}

- (id)_appendArchivedItemsToItemsArray:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  __int16 v31;
  uint8_t v32[16];
  uint8_t v33[16];
  __int16 v34;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "appending archived items to current items array", buf, 2u);
    }

  }
  -[IMItemsController _items](self, "_items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v34 = 0;
        v20 = "Cannot append to either beginning or end as there are no previous items to append to";
        v21 = (uint8_t *)&v34;
LABEL_27:
        _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, v20, v21, 2u);
      }
LABEL_28:

    }
LABEL_29:
    v18 = v4;
    goto LABEL_30;
  }
  objc_msgSend(v4, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "messageID");
  -[IMItemsController _items](self, "_items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastMessageItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "messageID");

  if (v9 == v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Going to append the incoming messages to the end of the _items array", v33, 2u);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 1, objc_msgSend(v4, "count") - 1);
    -[IMItemsController _items](self, "_items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v4, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "messageID");
  -[IMItemsController _items](self, "_items");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstMessageItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "messageID");

  v27 = IMOSLoggingEnabled();
  if (v23 != v26)
  {
    if (v27)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v31 = 0;
        v20 = "Cannot append to either beginning or end as there is a mismatch in messageIDs";
        v21 = (uint8_t *)&v31;
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  if (v27)
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "Going to append the incoming messages to the beginning of the _items array", v32, 2u);
    }

  }
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    -[IMItemsController _items](self, "_items");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_30;
    goto LABEL_29;
  }
  v29 = objc_msgSend(v4, "count") - 1;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v29);
  objc_msgSend(v4, "objectsAtIndexes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItemsController _items](self, "_items");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v17 = (void *)v16;
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_29;
LABEL_30:

  return v18;
}

- (id)_lastMessageItemMatchingCriteria:(id)a3
{
  uint64_t (**v4)(id, void *);
  __CFArray *items;
  CFIndex Count;
  CFIndex v7;
  void *v8;

  v4 = (uint64_t (**)(id, void *))a3;
  items = self->_items;
  Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_7:
    v8 = 0;
  }
  else
  {
    v7 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(items, v7 - 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v8, "isLastMessageCandidate")
        && (v4[2](v4, v8) & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v7 <= 1)
        goto LABEL_7;
    }
  }

  return v8;
}

- (id)_lastMessageItemWithService:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A205F07C;
  v8[3] = &unk_1E471F368;
  v9 = v4;
  v5 = v4;
  -[IMItemsController _lastMessageItemMatchingCriteria:](self, "_lastMessageItemMatchingCriteria:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_lastMessageItemWithServiceCapability:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A205F140;
  v8[3] = &unk_1E471F368;
  v9 = v4;
  v5 = v4;
  -[IMItemsController _lastMessageItemMatchingCriteria:](self, "_lastMessageItemMatchingCriteria:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (__CFArray)items
{
  return self->_items;
}

- (void)setItems:(__CFArray *)a3
{
  self->_items = a3;
}

- (void)_didReplaceItem:(__CFArray *)a3 oldItem:(id)a4 idx:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __CFArray *v21;
  int64_t v22;

  v7 = a4;
  CFArrayGetValueAtIndex(a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1A211C998;
    v18[3] = &unk_1E47227D8;
    v19 = v9;
    v21 = a3;
    v22 = a5;
    v20 = v7;
    v10 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v18);
    v10[2](v10, v11, v12, v13);

  }
  else if (objc_msgSend(v7, "associatedMessageType") == 2 && objc_msgSend(v8, "associatedMessageType") == 2)
  {
    objc_msgSend(v7, "associatedMessageGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "associatedMessageGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v15) & 1) != 0)
    {
      objc_msgSend(v7, "consumedSessionPayloads");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (!v17)
        goto LABEL_10;
      objc_msgSend(v7, "consumedSessionPayloads");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setConsumedSessionPayloads:", v14);
    }
    else
    {

    }
  }
LABEL_10:

}

@end
