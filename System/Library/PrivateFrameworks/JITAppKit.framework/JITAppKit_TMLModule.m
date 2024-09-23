@implementation JITAppKit_TMLModule

+ (BOOL)loadModule
{
  char v3;
  uint64_t obj;
  int v5;
  int v6;
  void (*v7)(_QWORD *);
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  char v14;
  SEL v15;
  id v16;
  id location;
  dispatch_once_t *v18;

  v16 = a1;
  v15 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x20000000;
  v13 = 32;
  v14 = 1;
  obj = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __33__JITAppKit_TMLModule_loadModule__block_invoke;
  v8 = &unk_24E0995A8;
  v9 = &v10;
  v18 = (dispatch_once_t *)&loadModule_onceToken;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v3 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v3 & 1;
}

+ (void)initializeJSContext:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location[3];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)MEMORY[0x24BDDA730];
  v4 = (id)objc_msgSend(location[0], "context");
  v38 = (id)objc_msgSend(v3, "valueWithNewObjectInContext:");

  v5 = location[0];
  v21 = (_QWORD *)MEMORY[0x24BDDA600];
  v56[0] = *MEMORY[0x24BDDA600];
  v57[0] = v38;
  v22 = (_QWORD *)MEMORY[0x24BDDA608];
  v56[1] = *MEMORY[0x24BDDA608];
  v23 = MEMORY[0x24BDBD1C0];
  v57[1] = MEMORY[0x24BDBD1C0];
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56);
  objc_msgSend(v5, "defineProperty:descriptor:", CFSTR("JITAppKit"));

  v37 = _Block_copy(&__block_literal_global_0);
  v36 = _Block_copy(&__block_literal_global_8);
  v7 = v38;
  v54[0] = *MEMORY[0x24BDDA5F0];
  v55[0] = v37;
  v54[1] = *MEMORY[0x24BDDA5F8];
  v55[1] = v36;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  objc_msgSend(v7, "defineProperty:descriptor:", CFSTR("baseURL"));

  v35 = _Block_copy(&__block_literal_global_12);
  v9 = v38;
  v52[0] = *v21;
  v53[0] = v35;
  v52[1] = *v22;
  v53[1] = v23;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  objc_msgSend(v9, "defineProperty:descriptor:", CFSTR("loadPage"));

  v34 = _Block_copy(&__block_literal_global_17);
  v11 = v38;
  v50[0] = *v21;
  v51[0] = v34;
  v50[1] = *v22;
  v51[1] = v23;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  objc_msgSend(v11, "defineProperty:descriptor:", CFSTR("loadPageWithData"));

  v33 = _Block_copy(&__block_literal_global_21);
  v13 = v38;
  v48[0] = *v21;
  v49[0] = v33;
  v48[1] = *v22;
  v49[1] = v23;
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  objc_msgSend(v13, "defineProperty:descriptor:", CFSTR("loadPageWithDataURL"));

  v32 = _Block_copy(&__block_literal_global_25);
  v15 = v38;
  v46[0] = *v21;
  v47[0] = v32;
  v46[1] = *v22;
  v47[1] = v23;
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  objc_msgSend(v15, "defineProperty:descriptor:", CFSTR("loadView"));

  v31 = _Block_copy(&__block_literal_global_28);
  v17 = v38;
  v44[0] = *v21;
  v45[0] = v31;
  v44[1] = *v22;
  v45[1] = v23;
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  objc_msgSend(v17, "defineProperty:descriptor:", CFSTR("loadClass"));

  v30 = _Block_copy(&__block_literal_global_31);
  v19 = v38;
  v42[0] = *v21;
  v43[0] = v30;
  v42[1] = *v22;
  v43[1] = v23;
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  objc_msgSend(v19, "defineProperty:descriptor:", CFSTR("loadObject"));

  v29 = _Block_copy(&__block_literal_global_35);
  v24 = v38;
  v40[0] = *v21;
  v41[0] = v29;
  v40[1] = *v22;
  v41[1] = v23;
  v25 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  objc_msgSend(v24, "defineProperty:descriptor:", CFSTR("dismissApplication"));

  v26 = _Block_copy(&__block_literal_global_39);
  objc_msgSend(location[0], "setObject:forKeyedSubscript:");

  v27 = _Block_copy(&__block_literal_global_46);
  objc_msgSend(location[0], "setObject:forKeyedSubscript:");

  v28 = _Block_copy(&__block_literal_global_50);
  objc_msgSend(location[0], "setObject:forKeyedSubscript:");

  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

@end
