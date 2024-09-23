@implementation NSURLSession(MSVTaskCapturingCompletion)

- (id)msv_dataTaskWithRequest:()MSVTaskCapturingCompletion completionHandler:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4818;
  v20 = __Block_byref_object_dispose__4819;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__NSURLSession_MSVTaskCapturingCompletion__msv_dataTaskWithRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E43E9C30;
  v15 = &v16;
  v8 = v7;
  v14 = v8;
  objc_msgSend(a1, "dataTaskWithRequest:completionHandler:", v6, v13);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v17[5];
  v17[5] = v9;

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)msv_uploadTaskWithRequest:()MSVTaskCapturingCompletion fromData:completionHandler:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4818;
  v23 = __Block_byref_object_dispose__4819;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__NSURLSession_MSVTaskCapturingCompletion__msv_uploadTaskWithRequest_fromData_completionHandler___block_invoke;
  v16[3] = &unk_1E43E9C30;
  v18 = &v19;
  v11 = v10;
  v17 = v11;
  objc_msgSend(a1, "uploadTaskWithRequest:fromData:completionHandler:", v8, v9, v16);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v20[5];
  v20[5] = v12;

  v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (id)msv_downloadTaskWithRequest:()MSVTaskCapturingCompletion completionHandler:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4818;
  v20 = __Block_byref_object_dispose__4819;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__NSURLSession_MSVTaskCapturingCompletion__msv_downloadTaskWithRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E43E9C58;
  v15 = &v16;
  v8 = v7;
  v14 = v8;
  objc_msgSend(a1, "downloadTaskWithRequest:completionHandler:", v6, v13);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v17[5];
  v17[5] = v9;

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

@end
