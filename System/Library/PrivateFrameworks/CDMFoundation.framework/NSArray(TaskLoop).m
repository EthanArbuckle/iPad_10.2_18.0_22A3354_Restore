@implementation NSArray(TaskLoop)

- (void)enumerateTaskParallelly:()TaskLoop blockCompleteAllTask:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void (**v17)(_QWORD);
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *(*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke;
  v25[3] = &unk_24DCAC830;
  v13 = v6;
  v27 = v13;
  v9 = v8;
  v26 = v9;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v25);
  v10 = (void *)objc_opt_new();
  if (v9 && objc_msgSend(v9, "count", v13))
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = 0;
      do
      {
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__6654;
        v23 = __Block_byref_object_dispose__6655;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v20[5];
        if (v12)
        {
          v14[0] = MEMORY[0x24BDAC760];
          v14[1] = 3221225472;
          v14[2] = __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2;
          v14[3] = &unk_24DCAC858;
          v15 = v10;
          v18 = &v19;
          v16 = v9;
          v17 = v7;
          (*(void (**)(uint64_t, _QWORD, _QWORD *))(v12 + 16))(v12, 0, v14);

        }
        _Block_object_dispose(&v19, 8);

        ++v11;
      }
      while (objc_msgSend(v9, "count") > v11);
    }
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

@end
