@implementation CVNLPVisionRequestHandler

- (CVNLPVisionRequestHandler)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6;
  id v7;
  CVNLPVisionRequestHandler *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  objc_class *v12;
  VN6Mb1ME89lyW3HpahkEygIG *v13;
  VN6Mb1ME89lyW3HpahkEygIG *significantRequest;
  char *v15;
  void *v16;
  objc_class *v17;
  VNVYvzEtX1JlUdu8xx5qhDI *v18;
  VNVYvzEtX1JlUdu8xx5qhDI *nsfwRequest;
  uint64_t v20;
  char *v21;
  _QWORD v23[4];
  id v24;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;
  Class (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CVNLPVisionRequestHandler;
  v8 = -[CVNLPCaptionModelBase initWithOptions:runTimeParams:](&v25, sel_initWithOptions_runTimeParams_, v6, v7);
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1B037FB04;
    v23[3] = &unk_1E60CE308;
    v24 = v7;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E082B4](v23);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v11 = (void *)qword_1EEEB2918;
    v34 = qword_1EEEB2918;
    if (!qword_1EEEB2918)
    {
      v26 = v9;
      v27 = 3221225472;
      v28 = sub_1B038005C;
      v29 = &unk_1E60CDE98;
      v30 = &v31;
      sub_1B038005C((uint64_t)&v26);
      v11 = (void *)v32[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v31, 8);
    v13 = (VN6Mb1ME89lyW3HpahkEygIG *)objc_alloc_init(v12);
    significantRequest = v8->_significantRequest;
    v8->_significantRequest = v13;

    ((void (**)(_QWORD, VN6Mb1ME89lyW3HpahkEygIG *))v10)[2](v10, v8->_significantRequest);
    if (objc_claimAutoreleasedReturnValue())
    {
      v15 = (char *)operator new(0x20uLL);
      strcpy(v15, "Failed to create s-classifier");
      sub_1B036AFC8(6u, (uint64_t)v15);
    }
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v16 = (void *)qword_1EEEB2928;
    v34 = qword_1EEEB2928;
    if (!qword_1EEEB2928)
    {
      v26 = v9;
      v27 = 3221225472;
      v28 = sub_1B0380160;
      v29 = &unk_1E60CDE98;
      v30 = &v31;
      sub_1B0380160((uint64_t)&v26);
      v16 = (void *)v32[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v31, 8);
    v18 = (VNVYvzEtX1JlUdu8xx5qhDI *)objc_alloc_init(v17);
    nsfwRequest = v8->_nsfwRequest;
    v8->_nsfwRequest = v18;

    ((void (**)(_QWORD, VNVYvzEtX1JlUdu8xx5qhDI *))v10)[2](v10, v8->_nsfwRequest);
    v20 = objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (char *)operator new(0x20uLL);
      strcpy(v21, "Failed to create n-classifier");
      sub_1B036AFC8(6u, (uint64_t)v21);
    }

  }
  return v8;
}

- (id)classifyImage:(__CVBuffer *)a3
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;
  _QWORD v16[7];
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1B037FDA0;
  v24 = sub_1B037FDB0;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_1B037FDA0;
  v18[4] = sub_1B037FDB0;
  v19 = 0;
  objc_msgSend_perfResults(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B037FDB8;
  v17[3] = &unk_1E60CE330;
  v17[4] = v18;
  v17[5] = a3;
  objc_msgSend_run_block_(v6, v8, (uint64_t)CFSTR("VisionRequestCreation"), (uint64_t)v17);

  objc_msgSend_perfResults(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = sub_1B037FE9C;
  v16[3] = &unk_1E60CE358;
  v16[4] = self;
  v16[5] = v18;
  v16[6] = &v20;
  objc_msgSend_run_block_(v12, v13, (uint64_t)CFSTR("VisionPerformRequest"), (uint64_t)v16);

  v14 = (id)v21[5];
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&v20, 8);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantRequest, 0);
  objc_storeStrong((id *)&self->_nsfwRequest, 0);
}

@end
