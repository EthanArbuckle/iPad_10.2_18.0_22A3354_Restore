@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_valueForKey_(v9, v10, (uint64_t)v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EE16E6F0 != -1)
    dispatch_once(&qword_1EE16E6F0, &unk_1E2954CC8);
  v14 = qword_1EE16E6E8;
  if (os_log_type_enabled((os_log_t)qword_1EE16E6E8, OS_LOG_TYPE_INFO))
  {
    v15 = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", (uint8_t *)&v15, 0x16u);
  }
  sub_18F270000((uint64_t)a6, v8, v13);

}

@end
