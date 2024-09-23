@implementation IMAggregateAcknowledgmentChatItem

- (BOOL)includesFromMe
{
  return self->_fromMeAcknowledgement != 0;
}

- (id)_initWithAcknowledgments:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (*v10)(void *);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void (*v28)(void *);
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("acknowledgments array must be nonempty"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("acknowledgments.count > 0"), "-[IMAggregateAcknowledgmentChatItem _initWithAcknowledgments:]", v7, 5208, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v10)
    {
      v10(v9);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
    v4 = v5;
  }
  v33 = v4;
  objc_msgSend(v4, "lastObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[IMAssociatedMessageChatItem _initWithItem:sender:](self, "_initWithItem:sender:", v12, v13);

  if (v14)
  {
    v15 = objc_msgSend(v33, "copy");
    v16 = (void *)*((_QWORD *)v14 + 21);
    *((_QWORD *)v14 + 21) = v15;

    objc_msgSend(v14, "_setParentMessageIsFromMe:", objc_msgSend(v34, "parentMessageIsFromMe"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = *((id *)v14 + 21);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v14, "associatedMessageGUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "associatedMessageGUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if ((v23 & 1) == 0)
          {
            v24 = (void *)MEMORY[0x1E0CB3940];
            v25 = IMFileLocationTrimFileName();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("all acknowledgments must have the same associated message"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("[self.associatedMessageGUID isEqualToString:acknowledgment.associatedMessageGUID]"), "-[IMAggregateAcknowledgmentChatItem _initWithAcknowledgments:]", v25, 5215, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = (void (*)(void *))IMGetAssertionFailureHandler();
            if (v28)
            {
              v28(v27);
            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v27;
                _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
              }

            }
          }
          if (objc_msgSend(v20, "isFromMe"))
            objc_storeStrong((id *)v14 + 22, v20);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v17);
    }

    *((_BYTE *)v14 + 161) = (unint64_t)objc_msgSend(v33, "count") > 1;
    *((_BYTE *)v14 + 160) = objc_msgSend(v34, "isFromMe");
    objc_msgSend(v34, "tapback");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v14 + 23);
    *((_QWORD *)v14 + 23) = v30;

    v36 = 0u;
    objc_msgSend(v14, "geometryDescriptor");
    *(_QWORD *)&v36 = 10;
    *(_OWORD *)buf = v36;
    v42 = 0u;
    v43 = 0u;
    v44 = 0;
    objc_msgSend(v14, "_setGeometryDescriptor:", buf);
  }

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSArray lastObject](self->_acknowledgments, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_latestIsFromMe == *((unsigned __int8 *)v5 + 160)
      && -[IMTapback isEqual:](self->_latestTapback, "isEqual:", v5[23])
      && self->_includesMultiple == *((unsigned __int8 *)v5 + 161))
    {
      v6 = -[NSArray isEqual:](self->_acknowledgments, "isEqual:", v5[21]);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithAcknowledgments:", self->_acknowledgments);
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (BOOL)canDelete
{
  return 1;
}

- (NSArray)acknowledgments
{
  return self->_acknowledgments;
}

- (IMMessageAcknowledgmentChatItem)fromMeAcknowledgement
{
  return self->_fromMeAcknowledgement;
}

- (BOOL)latestIsFromMe
{
  return self->_latestIsFromMe;
}

- (BOOL)includesMultiple
{
  return self->_includesMultiple;
}

- (IMTapback)latestTapback
{
  return self->_latestTapback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTapback, 0);
  objc_storeStrong((id *)&self->_fromMeAcknowledgement, 0);
  objc_storeStrong((id *)&self->_acknowledgments, 0);
}

@end
