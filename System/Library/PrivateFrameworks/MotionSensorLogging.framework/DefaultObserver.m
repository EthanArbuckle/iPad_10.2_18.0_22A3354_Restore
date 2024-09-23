@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _BYTE v16[24];
  void *v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "valueForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_257206B38 != -1)
    dispatch_once(&qword_257206B38, &unk_25135BB90);
  v11 = qword_257206B30;
  if (os_log_type_enabled((os_log_t)qword_257206B30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v16 = 138543618;
    *(_QWORD *)&v16[4] = v8;
    *(_WORD *)&v16[12] = 2114;
    *(_QWORD *)&v16[14] = v10;
    _os_log_impl(&dword_242728000, v11, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", v16, 0x16u);
  }
  v12 = v8;
  v13 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(*((id *)a6 + 2), "setObject:forKeyedSubscript:", v13, v12);

  if (!*(_BYTE *)a6)
  {
    *(_BYTE *)a6 = 1;
    v14 = dispatch_time(0, 10000000000);
    if (qword_257206B28 != -1)
      dispatch_once(&qword_257206B28, &unk_25135BB50);
    v15 = (id)qword_257206B20;
    *(_QWORD *)v16 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v16[8] = 3221225472;
    *(_QWORD *)&v16[16] = sub_24272C2F0;
    v17 = &unk_25135BB70;
    v18 = a6;
    dispatch_after(v14, v15, v16);

  }
}

@end
