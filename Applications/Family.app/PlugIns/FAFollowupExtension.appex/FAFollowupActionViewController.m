@implementation FAFollowupActionViewController

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;

  v9 = a3;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = a4;
  v14 = _FALogSystem(v11, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
    v43 = 138412290;
    v44 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Processing followup item with info: %@", (uint8_t *)&v43, 0xCu);

  }
  objc_storeStrong((id *)&self->_followupItem, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", AKActionKey));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", AKFollowUpSafariURLKey));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", AKFollowUpURLKey));

  if (v22)
  {
    v26 = _FALogSystem(v23, v24, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v43 = 138412290;
      v44 = v22;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Received URL key: %@", (uint8_t *)&v43, 0xCu);
    }

    -[FAFollowupActionViewController handleActionWithURLKey:completion:](self, "handleActionWithURLKey:completion:", v22, v10);
  }
  else if (v20)
  {
    v28 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));
    v31 = (void *)v28;
    if (v28)
    {
      v32 = _FALogSystem(v28, v29, v30);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v43 = 138412290;
        v44 = v20;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Received URL: %@", (uint8_t *)&v43, 0xCu);
      }

      -[FAFollowupActionViewController handleActionWithURL:](self, "handleActionWithURL:", v31);
    }
    v10[2](v10, 1);

  }
  else
  {
    v34 = _FALogSystem(v23, v24, v25);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = v35;
    if (v18)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v43 = 138412290;
        v44 = v18;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Received AKAction %@", (uint8_t *)&v43, 0xCu);
      }

      v37 = (void *)objc_opt_new(AKFollowUpTearDownContext);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpItem uniqueIdentifier](self->_followupItem, "uniqueIdentifier"));
      objc_msgSend(v37, "setItemIdentifier:", v38);

      objc_msgSend(v37, "setAkAction:", v18);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", AKFollowUpIDMSDataKey));

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", AKFollowUpAltDSIDKey));

      if (v40)
        objc_msgSend(v37, "setIdmsData:", v40);
      if (v42)
        objc_msgSend(v37, "setAltDSID:", v42);
      -[FAFollowupActionViewController handleAKAction:completion:](self, "handleAKAction:completion:", v37, v10);

    }
    else
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_1000031DC(v36);

      v10[2](v10, 1);
    }
  }

}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)handleActionWithURLKey:(id)a3 completion:(id)a4
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void (**)(id, uint64_t))a4;
  v5 = _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Subclasses must override this method.", v7, 2u);
  }

  v4[2](v4, 1);
}

- (void)handleAKAction:(id)a3 completion:(id)a4
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void (**)(id, uint64_t))a4;
  v5 = _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Subclasses must override this method.", v7, 2u);
  }

  v4[2](v4, 1);
}

- (void)handleActionWithURL:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Subclasses must override this method.", v5, 2u);
  }

}

- (FLFollowUpItem)followupItem
{
  return self->_followupItem;
}

- (void)setFollowupItem:(id)a3
{
  objc_storeStrong((id *)&self->_followupItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followupItem, 0);
}

@end
