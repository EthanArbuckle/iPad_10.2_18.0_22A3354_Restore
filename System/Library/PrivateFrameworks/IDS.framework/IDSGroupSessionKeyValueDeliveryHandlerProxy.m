@implementation IDSGroupSessionKeyValueDeliveryHandlerProxy

- (IDSGroupSessionKeyValueDeliveryHandlerProxy)initWithHandler:(id)a3
{
  id v4;
  IDSGroupSessionKeyValueDeliveryHandlerProxy *v5;
  IDSGroupSessionKeyValueDeliveryHandlerProxy *v6;
  uint64_t v7;
  NSUUID *handlerUUID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSGroupSessionKeyValueDeliveryHandlerProxy;
  v5 = -[IDSGroupSessionKeyValueDeliveryHandlerProxy init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_handler, v4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    handlerUUID = v6->_handlerUUID;
    v6->_handlerUUID = (NSUUID *)v7;

  }
  return v6;
}

- (void)handleGroupSessionKeyValues:(id)a3
{
  id v4;
  char isKindOfClass;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  char v24;
  NSObject *v25;
  NSObject *WeakRetained;
  id v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id *location;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  NSObject *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionKeyValueDelivery");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v4;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: received dictionary %@", buf, 0xCu);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = v4;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    if (v8)
    {
      v9 = v8;
      v27 = v4;
      v10 = *(_QWORD *)v39;
      location = (id *)&self->_handler;
      v28 = *(_QWORD *)v39;
      v29 = v7;
      do
      {
        v11 = 0;
        v30 = v9;
        do
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
          -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v32 = (void *)v13;
          LOBYTE(v13) = objc_opt_isKindOfClass();
          objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionKeyValueDelivery");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if ((v13 & 1) != 0)
          {
            v31 = v11;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v12;
              _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: key %@", buf, 0xCu);
            }

            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v15 = v32;
            v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v35;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v35 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                  objc_opt_class();
                  v21 = objc_opt_isKindOfClass();
                  objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionKeyValueDelivery");
                  v22 = objc_claimAutoreleasedReturnValue();
                  v23 = v22;
                  if ((v21 & 1) != 0)
                  {
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v43 = v12;
                      v44 = 2112;
                      v45 = v20;
                      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: key:%@ participantID:%@", buf, 0x16u);
                    }

                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v20);
                    v23 = objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v24 = objc_opt_isKindOfClass();
                    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionKeyValueDelivery");
                    v25 = objc_claimAutoreleasedReturnValue();
                    WeakRetained = v25;
                    if ((v24 & 1) != 0)
                    {
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412802;
                        v43 = v12;
                        v44 = 2112;
                        v45 = v20;
                        v46 = 2112;
                        v47 = v23;
                        _os_log_impl(&dword_1906E0000, WeakRetained, OS_LOG_TYPE_DEFAULT, "handleGroupSessionKeyValues: key:%@ participantID:%@ data:%@", buf, 0x20u);
                      }

                      WeakRetained = objc_loadWeakRetained(location);
                      -[NSObject handleGroupSessionValue:forKey:participant:](WeakRetained, "handleGroupSessionValue:forKey:participant:", v23, objc_msgSend(v12, "intValue"), objc_msgSend(v20, "unsignedLongLongValue"));
                    }
                    else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412802;
                      v43 = v12;
                      v44 = 2112;
                      v45 = v20;
                      v46 = 2112;
                      v47 = v23;
                      _os_log_error_impl(&dword_1906E0000, WeakRetained, OS_LOG_TYPE_ERROR, "handleGroupSessionKeyValues: invalid value for key:%@ participantID:%@ value:%@", buf, 0x20u);
                    }

                  }
                  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v43 = v12;
                    v44 = 2112;
                    v45 = v20;
                    _os_log_error_impl(&dword_1906E0000, v23, OS_LOG_TYPE_ERROR, "handleGroupSessionKeyValues: invalid participantID for key:%@ participantID:%@", buf, 0x16u);
                  }

                }
                v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
              }
              while (v17);
              v10 = v28;
              v7 = v29;
              v9 = v30;
            }
            v11 = v31;
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v12;
            v44 = 2112;
            v45 = v32;
            _os_log_error_impl(&dword_1906E0000, v15, OS_LOG_TYPE_ERROR, "handleGroupSessionKeyValues: remoteParticipantIDToData is not a dictionary for key:%@ data: %@", buf, 0x16u);
          }

          ++v11;
        }
        while (v11 != v9);
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      }
      while (v9);
      v4 = v27;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1907F9488((uint64_t)v4, v7);
  }

}

- (NSUUID)handlerUUID
{
  return self->_handlerUUID;
}

- (void)setHandlerUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IDSGroupSessionKeyValueDeliveryHandler)handler
{
  return (IDSGroupSessionKeyValueDeliveryHandler *)objc_loadWeakRetained((id *)&self->_handler);
}

- (void)setHandler:(id)a3
{
  objc_storeWeak((id *)&self->_handler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_handlerUUID, 0);
}

@end
