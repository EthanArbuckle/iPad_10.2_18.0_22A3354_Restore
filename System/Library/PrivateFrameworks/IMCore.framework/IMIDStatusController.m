@implementation IMIDStatusController

+ (id)sharedInstance
{
  if (qword_1ECF125B8 != -1)
    dispatch_once(&qword_1ECF125B8, &unk_1E471D9D8);
  return (id)qword_1ECF12618;
}

- (IMIDStatusController)init
{
  IMIDStatusController *v2;
  IMIDStatusController *v3;
  NSMutableSet *v4;
  NSMutableSet *servicesRegistered;
  NSRecursiveLock *v6;
  NSRecursiveLock *servicesLock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMIDStatusController;
  v2 = -[IMIDStatusController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->_servicesRegistered)
    {
      v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      servicesRegistered = v3->_servicesRegistered;
      v3->_servicesRegistered = v4;

    }
    v6 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    servicesLock = v3->_servicesLock;
    v3->_servicesLock = v6;

  }
  return v3;
}

- (void)_processIDStatusResponseForURI:(id)a3 resultStatus:(int64_t)a4 forService:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  int64_t v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A20F65CC;
  block[3] = &unk_1E4721688;
  v12 = v8;
  v13 = v7;
  v14 = a4;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (int64_t)__statusForID:(id)a3 onService:(id)a4 isCanonicalized:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  _QWORD v25[5];
  _BYTE buf[24];
  void *v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "length") >= 2
    && objc_msgSend(v8, "characterAtIndex:", 1) == 58)
  {
    v10 = 3;
  }
  else
  {
    v10 = 0;
    if (v8 && v9)
    {
      if (v5)
      {
        objc_msgSend(v8, "_bestGuessURIFromCanicalizedID");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v8, "_appearsToBePhoneNumber")
          && (objc_msgSend(v8, "hasPrefix:", CFSTR("+")) & 1) == 0)
        {
          IMCleanupPhoneNumber();
          v12 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v12;
        }
        objc_msgSend(v8, "_bestGuessURI");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v11;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2112;
          v27 = v13;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_DEBUG, "ID %@  onService: %@   (URI: %@)", buf, 0x20u);
        }

      }
      sub_1A20F6E18(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSRecursiveLock lock](self->_servicesLock, "lock");
      if ((-[NSMutableSet containsObject:](self->_servicesRegistered, "containsObject:", v15) & 1) == 0)
      {
        -[NSMutableSet addObject:](self->_servicesRegistered, "addObject:", v15);
        objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addDelegate:forService:listenerID:queue:", self, v15, CFSTR("IMIDStatusControllerListenerID"), MEMORY[0x1E0C80D38]);

      }
      -[NSRecursiveLock unlock](self->_servicesLock, "unlock");
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v27 = 0;
      if (qword_1EE65F648 != -1)
        dispatch_once(&qword_1EE65F648, &unk_1E471B8E0);
      pthread_mutex_lock(&stru_1EE65D2A0);
      objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "_hasCacheForService:", v15);

      v19 = (void *)MEMORY[0x1E0D39880];
      if (v18)
      {
        v20 = objc_msgSend(MEMORY[0x1E0D39880], "_currentCachedIDStatusForDestination:service:listenerID:", v13, v15, CFSTR("IMIDStatusControllerListenerID"));
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v20;
      }
      else
      {
        dispatch_get_global_queue(0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = sub_1A20F6E74;
        v25[3] = &unk_1E4722160;
        v25[4] = buf;
        objc_msgSend(v19, "currentIDStatusForDestination:service:listenerID:queue:completionBlock:", v13, v15, CFSTR("IMIDStatusControllerListenerID"), v21, v25);

        v22 = qword_1EE65F640;
        v23 = dispatch_time(0, 5000000);
        dispatch_semaphore_wait(v22, v23);
      }
      pthread_mutex_unlock(&stru_1EE65D2A0);
      v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);

    }
  }

  return v10;
}

- (int64_t)_idStatusForID:(id)a3 onService:(id)a4
{
  return MEMORY[0x1E0DE7D20](self, sel___statusForID_onService_isCanonicalized_);
}

- (int64_t)_statusForCanonicalizedID:(id)a3 onService:(id)a4
{
  return MEMORY[0x1E0DE7D20](self, sel___statusForID_onService_isCanonicalized_);
}

- (int64_t)_idStatusForID:(id)a3 onAccount:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  IMCleanupPhoneNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = (int64_t)v5;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "ID %@  onAccount: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[IMIDStatusController _idStatusForID:onService:](self, "_idStatusForID:onService:", v6, v9);

    objc_msgSend(v5, "existingIMHandleWithID:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIDStatus:", v8);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = v6;
        v15 = 2048;
        v16 = v8;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Status for %@ is %ld", (uint8_t *)&v13, 0x16u);
      }

    }
  }

  return v8;
}

- (void)_requestStatusForID:(id)a3 onService:(id)a4 onAccount:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  IMIDStatusController *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t)a4;
  v10 = (uint64_t)a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_DEBUG, "ID %@  onService: %@  onAccount: %@", buf, 0x20u);
    }

  }
  if (v8)
  {
    if (v9 | v10)
    {
      if (!v10)
      {
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_bestOperationalAccountForSendingForService:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

      }
      if (!v9)
      {
        objc_msgSend((id)v10, "service");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend((id)v10, "_isUsableForSending")
        && objc_msgSend((id)v9, "supportsIDStatusLookup"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v8;
            v28 = 2112;
            v29 = v9;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Sending request to daemon for ID %@ onService %@", buf, 0x16u);
          }

        }
        if ((objc_msgSend(v8, "_appearsToBePhoneNumber") & 1) != 0)
          v14 = MEMORY[0x1A8581FB4](v8, 0, 1);
        else
          v14 = MEMORY[0x1A8581F9C](v8);
        v16 = (void *)v14;
        sub_1A20F6E18((void *)v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSRecursiveLock lock](self->_servicesLock, "lock");
        if ((-[NSMutableSet containsObject:](self->_servicesRegistered, "containsObject:", v17) & 1) == 0)
        {
          -[NSMutableSet addObject:](self->_servicesRegistered, "addObject:", v17);
          objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addDelegate:forService:listenerID:queue:", self, v17, CFSTR("IMIDStatusControllerListenerID"), MEMORY[0x1E0C80D38]);

        }
        -[NSRecursiveLock unlock](self->_servicesLock, "unlock");
        v19 = (void *)MEMORY[0x1E0D39880];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = sub_1A20F7444;
        v22[3] = &unk_1E4722188;
        v23 = v16;
        v24 = self;
        v25 = v17;
        v20 = v17;
        v21 = v16;
        objc_msgSend(v19, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v21, v20, CFSTR("IMIDStatusControllerListenerID"), MEMORY[0x1E0C80D38], v22);

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v27 = v8;
          v28 = 2112;
          v29 = v9;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Cannot issue ID status for ID: %@   on service: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
  }

}

- (void)requestStatusForID:(id)a3 onService:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__requestStatusForID_onService_onAccount_);
}

- (void)requestStatusForID:(id)a3 onAccount:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__requestStatusForID_onService_onAccount_);
}

- (int64_t)statusForID:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "ID %@  onService: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v9 = -[IMIDStatusController _idStatusForID:onService:](self, "_idStatusForID:onService:", v6, v7);

  return v9;
}

- (NSRecursiveLock)_servicesLock
{
  return self->_servicesLock;
}

- (void)set_servicesLock:(id)a3
{
  objc_storeStrong((id *)&self->_servicesLock, a3);
}

- (NSMutableSet)_servicesRegistered
{
  return self->_servicesRegistered;
}

- (void)set_servicesRegistered:(id)a3
{
  objc_storeStrong((id *)&self->_servicesRegistered, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicesRegistered, 0);
  objc_storeStrong((id *)&self->_servicesLock, 0);
}

@end
