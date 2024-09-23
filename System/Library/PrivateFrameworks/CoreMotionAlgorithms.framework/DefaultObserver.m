@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend_valueForKey_(v9, v10, (uint64_t)v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_25518E2C0 != -1)
    dispatch_once(&qword_25518E2C0, &unk_24DF331A8);
  v13 = qword_25518E2B8;
  if (os_log_type_enabled((os_log_t)qword_25518E2B8, OS_LOG_TYPE_INFO))
  {
    v14 = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_21B72A000, v13, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", (uint8_t *)&v14, 0x16u);
  }
  sub_21B7979F8((uint64_t)a6, v8, v12);

}

@end
