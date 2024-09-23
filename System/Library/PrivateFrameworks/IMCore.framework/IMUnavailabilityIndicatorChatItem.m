@implementation IMUnavailabilityIndicatorChatItem

- (id)_initWithHandle:(id)a3 displayNotifyAnywayButton:(BOOL)a4
{
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMUnavailabilityIndicatorChatItem;
  v8 = -[IMChatItem _initWithItem:](&v15, sel__initWithItem_, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a3);
    *((_BYTE *)v9 + 56) = a4;
    objc_msgSend(v9[8], "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)sub_1A2132A84();

    objc_msgSend(v9, "_setGUID:", v11);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v9[9];
    v9[9] = (id)v12;

  }
  return v9;
}

- (void)setDisplayNotifyAnywayButton:(BOOL)a3
{
  if (self->_displayNotifyAnywayButton != a3)
  {
    self->_displayNotifyAnywayButton = a3;
    MEMORY[0x1E0DE7D20](self, sel__notifyDelegatesOfStateChange);
  }
}

- (void)_notifyDelegatesOfStateChange
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_unavailabilityIndicatorChatItemDelegates;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "displayNotifyAnywayButtonStateChanged:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addUnavailabilityIndicatorChatItemDelegate:(id)a3
{
  -[NSHashTable addObject:](self->_unavailabilityIndicatorChatItemDelegates, "addObject:", a3);
}

- (IMHandle)handle
{
  return self->_handle;
}

- (BOOL)displayNotifyAnywayButton
{
  return self->_displayNotifyAnywayButton;
}

- (NSHashTable)unavailabilityIndicatorChatItemDelegates
{
  return self->_unavailabilityIndicatorChatItemDelegates;
}

- (void)setUnavailabilityIndicatorChatItemDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_unavailabilityIndicatorChatItemDelegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailabilityIndicatorChatItemDelegates, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
