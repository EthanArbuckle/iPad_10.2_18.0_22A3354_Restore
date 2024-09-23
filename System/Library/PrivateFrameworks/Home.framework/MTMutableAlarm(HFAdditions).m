@implementation MTMutableAlarm(HFAdditions)

- (void)hf_moveToRoom:()HFAdditions withMediaProfileContainer:
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hf_home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_targetAccessoryInHome:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "room");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v6);

  if (v11)
  {
    HFLogForCategory(4uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = a1;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Not moving alarm: %@ since it is already in room: %@ ", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v7, "accessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__MTMutableAlarm_HFAdditions__hf_moveToRoom_withMediaProfileContainer___block_invoke;
    v19[3] = &unk_1EA727840;
    v14 = v6;
    v20 = v14;
    objc_msgSend(v13, "na_firstObjectPassingTest:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      COAlarmSiriContextTargetReferenceForAccessory();
      v16 = objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0D14888];
      v28[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setSiriContext:", v17);

      HFLogForCategory(4uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v22 = a1;
        v23 = 2112;
        v24 = v14;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Moved alarm: %@ to room: %@ using targetReferenceAccessory: %@", buf, 0x20u);
      }

    }
    else
    {
      HFLogForCategory(4uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = a1;
        v23 = 2112;
        v24 = v14;
        _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Error moving alarm: %@ to room: %@ since there is no targetReferenceAccessory for that room", buf, 0x16u);
      }
    }

    v12 = v20;
  }

}

@end
