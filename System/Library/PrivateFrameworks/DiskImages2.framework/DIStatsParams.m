@implementation DIStatsParams

- (DIStatsParams)initWithCoder:(id)a3
{
  id v4;
  DIStatsParams *v5;
  uint64_t v6;
  NSUUID *statInstanceID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIStatsParams;
  v5 = -[DIBaseParams initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statInstanceID"));
    v6 = objc_claimAutoreleasedReturnValue();
    statInstanceID = v5->_statInstanceID;
    v5->_statInstanceID = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIStatsParams;
  v4 = a3;
  -[DIBaseParams encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_statInstanceID, CFSTR("statInstanceID"), v5.receiver, v5.super_class);

}

- (DIStatsParams)initWithURL:(id)a3 instanceId:(id)a4 error:(id *)a5
{
  id v9;
  DIStatsParams *v10;
  id *p_isa;
  DIStatsParams *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DIStatsParams;
  v10 = -[DIBaseParams initWithURL:error:](&v14, sel_initWithURL_error_, a3, a5);
  p_isa = (id *)&v10->super.super.isa;
  if (v10)
  {
    if (!-[DIBaseParams openExistingImageWithFlags:error:](v10, "openExistingImageWithFlags:error:", 0, a5))
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong(p_isa + 7, a4);
  }
  v12 = p_isa;
LABEL_6:

  return v12;
}

- (id)statsWithError:(id *)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  DIClient2Controller_XPCHandler *v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if ((objc_msgSend((id)v16[5], "connectWithError:", a3) & 1) != 0)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__2;
    v13 = __Block_byref_object_dispose__2;
    v14 = 0;
    objc_msgSend((id)v16[5], "remoteProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__DIStatsParams_statsWithError___block_invoke;
    v8[3] = &unk_24CEED698;
    v8[4] = &v9;
    v8[5] = &v15;
    objc_msgSend(v5, "retrieveStatsWithParams:reply:", self, v8);

    if ((objc_msgSend((id)v16[5], "completeCommandWithError:", a3) & 1) != 0)
      v6 = (id)v10[5];
    else
      v6 = 0;
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v6;
}

void __32__DIStatsParams_statsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (!v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "signalCommandCompletedWithXpcError:", v6);

}

- (NSUUID)instanceID
{
  NSUUID *statInstanceID;
  objc_super v4;

  statInstanceID = self->_statInstanceID;
  if (statInstanceID)
    return statInstanceID;
  v4.receiver = self;
  v4.super_class = (Class)DIStatsParams;
  -[DIBaseParams instanceID](&v4, sel_instanceID);
  return (NSUUID *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)statInstanceID
{
  return self->_statInstanceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statInstanceID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
