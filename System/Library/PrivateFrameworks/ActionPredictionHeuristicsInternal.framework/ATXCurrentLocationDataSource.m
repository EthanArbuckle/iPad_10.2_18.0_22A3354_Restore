@implementation ATXCurrentLocationDataSource

- (ATXCurrentLocationDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXCurrentLocationDataSource *v6;
  ATXCurrentLocationDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCurrentLocationDataSource;
  v6 = -[ATXCurrentLocationDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)obtainOneTimeLocationWithCallback:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D54B8) & 1) != 0)
  {
    -[ATXHeuristicDevice locationManager](self->_device, "locationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ATXHeuristicDevice locationManager](self->_device, "locationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getCurrentLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v16[0] = CFSTR("lat");
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "coordinate");
        objc_msgSend(v8, "numberWithDouble:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = CFSTR("lon");
        v17[0] = v9;
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "coordinate");
        objc_msgSend(v10, "numberWithDouble:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v4[2](v4, v13, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C9E488], 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v4)[2](v4, 0, v15);

      }
    }
    else
    {
      __atxlog_handle_heuristic();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ATXCurrentLocationDataSource obtainOneTimeLocationWithCallback:].cold.1(v14);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, (void *)MEMORY[0x1E0C9AA70], v7);
    }

  }
  else
  {
    v4[2](v4, (void *)MEMORY[0x1E0C9AA70], 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)obtainOneTimeLocationWithCallback:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C99DF000, log, OS_LOG_TYPE_FAULT, "Someone tried to use location but a location manager was not set", v1, 2u);
}

@end
