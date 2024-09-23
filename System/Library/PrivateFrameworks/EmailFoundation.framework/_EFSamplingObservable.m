@implementation _EFSamplingObservable

- (_EFSamplingObservable)initWithObservable:(id)a3 sampler:(id)a4
{
  id v7;
  id v8;
  _EFSamplingObservable *v9;
  _EFSamplingObservable *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EFSamplingObservable;
  v9 = -[_EFSamplingObservable init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_sampler, a4);
  }

  return v10;
}

- (id)subscribe:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  EFObservable *sampler;
  void *v13;
  void *v14;
  EFObservable *observable;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD *v54;
  _QWORD aBlock[4];
  id v56;
  _QWORD *v57;
  _QWORD v58[5];
  id v59;

  v28 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy_;
  v58[4] = __Block_byref_object_dispose_;
  v59 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35___EFSamplingObservable_subscribe___block_invoke;
  aBlock[3] = &unk_1E62A5950;
  v6 = v4;
  v56 = v6;
  v57 = v58;
  v7 = _Block_copy(aBlock);
  v51[0] = v5;
  v51[1] = 3221225472;
  v51[2] = __35___EFSamplingObservable_subscribe___block_invoke_2;
  v51[3] = &unk_1E62A5978;
  v8 = v6;
  v52 = v8;
  v54 = v58;
  v9 = v28;
  v53 = v9;
  v10 = _Block_copy(v51);
  v48[0] = v5;
  v48[1] = 3221225472;
  v48[2] = __35___EFSamplingObservable_subscribe___block_invoke_3;
  v48[3] = &unk_1E62A59A0;
  v29 = v8;
  v49 = v29;
  v50 = v58;
  v11 = _Block_copy(v48);
  sampler = self->_sampler;
  v46[0] = v5;
  v46[1] = 3221225472;
  v46[2] = __35___EFSamplingObservable_subscribe___block_invoke_4;
  v46[3] = &unk_1E62A5900;
  v30 = v10;
  v47 = v30;
  +[EFObserver observerWithResultBlock:](EFObserver, "observerWithResultBlock:", v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable subscribe:](sampler, "subscribe:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  observable = self->_observable;
  v44[0] = v5;
  v44[1] = 3221225472;
  v44[2] = __35___EFSamplingObservable_subscribe___block_invoke_5;
  v44[3] = &unk_1E62A5900;
  v16 = v7;
  v45 = v16;
  v39[0] = v5;
  v39[1] = 3221225472;
  v39[2] = __35___EFSamplingObservable_subscribe___block_invoke_6;
  v39[3] = &unk_1E62A59C8;
  v40 = v14;
  v17 = v30;
  v42 = v17;
  v41 = v9;
  v43 = v11;
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __35___EFSamplingObservable_subscribe___block_invoke_7;
  v35[3] = &unk_1E62A59F0;
  v18 = v40;
  v36 = v18;
  v19 = v41;
  v37 = v19;
  v20 = v43;
  v38 = v20;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v44, v39, v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable subscribe:](observable, "subscribe:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __35___EFSamplingObservable_subscribe___block_invoke_8;
  v31[3] = &unk_1E62A5A18;
  v23 = v18;
  v32 = v23;
  v33 = v22;
  v24 = v20;
  v34 = v24;
  v25 = v22;
  +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v58, 8);
  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
