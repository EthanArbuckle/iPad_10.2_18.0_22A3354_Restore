@implementation CRKASMCollidingCourseFilter

+ (id)coursesByFilteringCollidingCoursesFromArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[4];
  uint64_t v30;
  _BYTE v31[128];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("identifier.stringValue"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v4;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v3;
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        objc_msgSend(v14, "identifier");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15 | v11
          && (v16 = (void *)v15,
              objc_msgSend(v14, "identifier"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v17, "isEqual:", v11),
              v17,
              v16,
              (v18 & 1) == 0))
        {
          objc_msgSend(v24, "addObject:", v14);
          objc_msgSend(v14, "identifier");
          v20 = objc_claimAutoreleasedReturnValue();

          v11 = v20;
        }
        else
        {
          if (_CRKLogASM_onceToken_0 != -1)
            dispatch_once(&_CRKLogASM_onceToken_0, &__block_literal_global_1);
          v19 = (void *)_CRKLogASM_logObj_0;
          if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_0, OS_LOG_TYPE_ERROR))
            +[CRKASMCollidingCourseFilter coursesByFilteringCollidingCoursesFromArray:].cold.1(v29, v19, v14, &v30);
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v21 = (void *)objc_msgSend(v24, "copy");
  return v21;
}

+ (void)coursesByFilteringCollidingCoursesFromArray:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_218C99000, v7, OS_LOG_TYPE_ERROR, "Found ClassKit class with colliding identifier. Not vending it. Class name: %@", a1, 0xCu);

}

@end
