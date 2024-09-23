@implementation ECMessageFlagChange

- (NSString)ef_publicDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[ECMessageFlagChange readChanged](self, "readChanged"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("read: %ld"), -[ECMessageFlagChange read](self, "read"));
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[ECMessageFlagChange deletedChanged](self, "deletedChanged"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("deleted: %ld"), -[ECMessageFlagChange deleted](self, "deleted"));
    objc_msgSend(v3, "addObject:", v5);

  }
  if (-[ECMessageFlagChange repliedChanged](self, "repliedChanged"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("replied: %ld"), -[ECMessageFlagChange replied](self, "replied"));
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[ECMessageFlagChange flaggedChanged](self, "flaggedChanged"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("flagged: %ld"), -[ECMessageFlagChange flagged](self, "flagged"));
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[ECMessageFlagChange draftChanged](self, "draftChanged"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("draft: %ld"), -[ECMessageFlagChange draft](self, "draft"));
    objc_msgSend(v3, "addObject:", v8);

  }
  if (-[ECMessageFlagChange forwardedChanged](self, "forwardedChanged"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("forwarded: %ld"), -[ECMessageFlagChange forwarded](self, "forwarded"));
    objc_msgSend(v3, "addObject:", v9);

  }
  if (-[ECMessageFlagChange redirectedChanged](self, "redirectedChanged"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("redirected: %ld"), -[ECMessageFlagChange redirected](self, "redirected"));
    objc_msgSend(v3, "addObject:", v10);

  }
  if (-[ECMessageFlagChange junkLevelSetByUserChanged](self, "junkLevelSetByUserChanged"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("junkLevelSetByUser: %ld"), -[ECMessageFlagChange junkLevelSetByUser](self, "junkLevelSetByUser"));
    objc_msgSend(v3, "addObject:", v11);

  }
  if (-[ECMessageFlagChange junkLevelChanged](self, "junkLevelChanged"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("junkLevel: %ld"), -[ECMessageFlagChange junkLevel](self, "junkLevel"));
    objc_msgSend(v3, "addObject:", v12);

  }
  if (-[ECMessageFlagChange flagColorChanged](self, "flagColorChanged"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("flagColor: %ld"), -[ECMessageFlagChange flagColor](self, "flagColor"));
    objc_msgSend(v3, "addObject:", v13);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %lu changes\n%@"), objc_opt_class(), self, objc_msgSend(v3, "count"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

+ (id)changeFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  ECMessageFlagChange *v7;
  id v8;
  id v9;
  ECMessageFlagChange *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = [ECMessageFlagChange alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__ECMessageFlagChange_changeFrom_to___block_invoke;
  v12[3] = &unk_1E7121450;
  v8 = v5;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v10 = -[ECMessageFlagChange initWithBuilder:](v7, "initWithBuilder:", v12);

  return v10;
}

void __37__ECMessageFlagChange_changeFrom_to___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "read");
  if (v3 != objc_msgSend(*(id *)(a1 + 40), "read"))
    objc_msgSend(v13, "changesReadTo:", objc_msgSend(*(id *)(a1 + 40), "read"));
  v4 = objc_msgSend(*(id *)(a1 + 32), "deleted");
  if (v4 != objc_msgSend(*(id *)(a1 + 40), "deleted"))
    objc_msgSend(v13, "changesDeletedTo:", objc_msgSend(*(id *)(a1 + 40), "deleted"));
  v5 = objc_msgSend(*(id *)(a1 + 32), "replied");
  if (v5 != objc_msgSend(*(id *)(a1 + 40), "replied"))
    objc_msgSend(v13, "changesRepliedTo:", objc_msgSend(*(id *)(a1 + 40), "replied"));
  v6 = objc_msgSend(*(id *)(a1 + 32), "flagged");
  if (v6 != objc_msgSend(*(id *)(a1 + 40), "flagged"))
    objc_msgSend(v13, "changesFlaggedTo:", objc_msgSend(*(id *)(a1 + 40), "flagged"));
  v7 = objc_msgSend(*(id *)(a1 + 32), "draft");
  if (v7 != objc_msgSend(*(id *)(a1 + 40), "draft"))
    objc_msgSend(v13, "changesDraftTo:", objc_msgSend(*(id *)(a1 + 40), "draft"));
  v8 = objc_msgSend(*(id *)(a1 + 32), "forwarded");
  if (v8 != objc_msgSend(*(id *)(a1 + 40), "forwarded"))
    objc_msgSend(v13, "changesForwardedTo:", objc_msgSend(*(id *)(a1 + 40), "forwarded"));
  v9 = objc_msgSend(*(id *)(a1 + 32), "redirected");
  if (v9 != objc_msgSend(*(id *)(a1 + 40), "redirected"))
    objc_msgSend(v13, "changesRedirectedTo:", objc_msgSend(*(id *)(a1 + 40), "redirected"));
  v10 = objc_msgSend(*(id *)(a1 + 32), "junkLevelSetByUser");
  if (v10 != objc_msgSend(*(id *)(a1 + 40), "junkLevelSetByUser"))
    objc_msgSend(v13, "changesJunkLevelSetByUserTo:", objc_msgSend(*(id *)(a1 + 40), "junkLevelSetByUser"));
  v11 = objc_msgSend(*(id *)(a1 + 32), "junkLevel");
  if (v11 != objc_msgSend(*(id *)(a1 + 40), "junkLevel"))
    objc_msgSend(v13, "changesJunkLevelTo:", objc_msgSend(*(id *)(a1 + 40), "junkLevel"));
  v12 = objc_msgSend(*(id *)(a1 + 32), "flagColor");
  if (v12 != objc_msgSend(*(id *)(a1 + 40), "flagColor"))
    objc_msgSend(v13, "changesFlagColorTo:", objc_msgSend(*(id *)(a1 + 40), "flagColor"));

}

+ (ECMessageFlagChange)setRead
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "changesReadTo:", 1);
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setDeleted
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "changesDeletedTo:", 1);
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)clearRead
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "changesReadTo:", 0);
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setFlagged
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "changesFlaggedTo:", 1);
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)clearFlagged
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "changesFlaggedTo:", 0);
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setReplied
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "changesRepliedTo:", 1);
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setForwarded
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "changesForwardedTo:", 1);
  return (ECMessageFlagChange *)v2;
}

- (ECMessageFlagChange)initWithBuilder:(id)a3
{
  void (**v4)(id, ECMessageFlagChange *);
  ECMessageFlagChange *v5;
  objc_super v7;

  v4 = (void (**)(id, ECMessageFlagChange *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECMessageFlagChange;
  v5 = -[ECMessageFlagChange init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (BOOL)hasChanges
{
  return -[ECMessageFlagChange readChanged](self, "readChanged")
      || -[ECMessageFlagChange deletedChanged](self, "deletedChanged")
      || -[ECMessageFlagChange repliedChanged](self, "repliedChanged")
      || -[ECMessageFlagChange flaggedChanged](self, "flaggedChanged")
      || -[ECMessageFlagChange draftChanged](self, "draftChanged")
      || -[ECMessageFlagChange forwardedChanged](self, "forwardedChanged")
      || -[ECMessageFlagChange redirectedChanged](self, "redirectedChanged")
      || -[ECMessageFlagChange junkLevelSetByUserChanged](self, "junkLevelSetByUserChanged")
      || -[ECMessageFlagChange junkLevelChanged](self, "junkLevelChanged")
      || -[ECMessageFlagChange flagColorChanged](self, "flagColorChanged");
}

- (id)flagsAfterChangingFlags:(id)a3 flagsWereChanged:(BOOL *)a4
{
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  ECMessageFlags *v14;
  ECMessageFlags *v15;
  char v16;
  id v17;
  ECMessageFlags *v18;
  char *v21;
  int v22;
  int v23;
  int v24;
  _QWORD v25[6];
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v5 = a3;
  v24 = objc_msgSend(v5, "read");
  if (!-[ECMessageFlagChange readChanged](self, "readChanged") || v24 == -[ECMessageFlagChange read](self, "read"))
  {
    v6 = 0;
  }
  else
  {
    LOBYTE(v24) = -[ECMessageFlagChange read](self, "read");
    v6 = 1;
  }
  v23 = objc_msgSend(v5, "deleted", a4);
  if (-[ECMessageFlagChange deletedChanged](self, "deletedChanged")
    && v23 != -[ECMessageFlagChange deleted](self, "deleted"))
  {
    LOBYTE(v23) = -[ECMessageFlagChange deleted](self, "deleted");
    v6 = 1;
  }
  v22 = objc_msgSend(v5, "replied");
  if (-[ECMessageFlagChange repliedChanged](self, "repliedChanged")
    && v22 != -[ECMessageFlagChange replied](self, "replied"))
  {
    LOBYTE(v22) = -[ECMessageFlagChange replied](self, "replied");
    v6 = 1;
  }
  v7 = objc_msgSend(v5, "flagged");
  if (-[ECMessageFlagChange flaggedChanged](self, "flaggedChanged")
    && v7 != -[ECMessageFlagChange flagged](self, "flagged"))
  {
    LOBYTE(v7) = -[ECMessageFlagChange flagged](self, "flagged");
    v6 = 1;
  }
  v8 = objc_msgSend(v5, "draft");
  if (-[ECMessageFlagChange draftChanged](self, "draftChanged") && v8 != -[ECMessageFlagChange draft](self, "draft"))
  {
    LOBYTE(v8) = -[ECMessageFlagChange draft](self, "draft");
    v6 = 1;
  }
  v9 = objc_msgSend(v5, "forwarded");
  if (-[ECMessageFlagChange forwardedChanged](self, "forwardedChanged")
    && v9 != -[ECMessageFlagChange forwarded](self, "forwarded"))
  {
    LOBYTE(v9) = -[ECMessageFlagChange forwarded](self, "forwarded");
    v6 = 1;
  }
  v10 = objc_msgSend(v5, "redirected");
  if (-[ECMessageFlagChange redirectedChanged](self, "redirectedChanged")
    && v10 != -[ECMessageFlagChange redirected](self, "redirected"))
  {
    LOBYTE(v10) = -[ECMessageFlagChange redirected](self, "redirected");
    v6 = 1;
  }
  v11 = objc_msgSend(v5, "junkLevelSetByUser");
  if (-[ECMessageFlagChange junkLevelSetByUserChanged](self, "junkLevelSetByUserChanged")
    && v11 != -[ECMessageFlagChange junkLevelSetByUser](self, "junkLevelSetByUser"))
  {
    LOBYTE(v11) = -[ECMessageFlagChange junkLevelSetByUser](self, "junkLevelSetByUser");
    v6 = 1;
  }
  v12 = objc_msgSend(v5, "junkLevel");
  if (-[ECMessageFlagChange junkLevelChanged](self, "junkLevelChanged")
    && v12 != -[ECMessageFlagChange junkLevel](self, "junkLevel"))
  {
    v12 = -[ECMessageFlagChange junkLevel](self, "junkLevel");
    v6 = 1;
  }
  v13 = objc_msgSend(v5, "flagColor");
  if (-[ECMessageFlagChange flagColorChanged](self, "flagColorChanged")
    && v13 != -[ECMessageFlagChange flagColor](self, "flagColor"))
  {
    v13 = -[ECMessageFlagChange flagColor](self, "flagColor");
    v17 = v5;
  }
  else
  {
    v14 = (ECMessageFlags *)v5;
    if (!v6)
    {
      v15 = v14;
      v16 = 0;
      goto LABEL_35;
    }
  }
  v18 = [ECMessageFlags alloc];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__ECMessageFlagChange_flagsAfterChangingFlags_flagsWereChanged___block_invoke;
  v25[3] = &__block_descriptor_56_e33_v16__0___ECMessageFlagsBuilder__8l;
  v26 = v24;
  v27 = v23;
  v28 = v22;
  v29 = v7;
  v30 = v8;
  v31 = v9;
  v32 = v10;
  v33 = v11;
  v25[4] = v12;
  v25[5] = v13;
  v15 = -[ECMessageFlags initWithBuilder:](v18, "initWithBuilder:", v25);

  v16 = 1;
LABEL_35:
  if (v21)
    *v21 = v16;

  return v15;
}

void __64__ECMessageFlagChange_flagsAfterChangingFlags_flagsWereChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRead:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v3, "setDeleted:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(v3, "setReplied:", *(unsigned __int8 *)(a1 + 50));
  objc_msgSend(v3, "setFlagged:", *(unsigned __int8 *)(a1 + 51));
  objc_msgSend(v3, "setDraft:", *(unsigned __int8 *)(a1 + 52));
  objc_msgSend(v3, "setForwarded:", *(unsigned __int8 *)(a1 + 53));
  objc_msgSend(v3, "setRedirected:", *(unsigned __int8 *)(a1 + 54));
  objc_msgSend(v3, "setJunkLevel:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setJunkLevelSetByUser:", *(unsigned __int8 *)(a1 + 55));
  objc_msgSend(v3, "setFlagColor:", *(_QWORD *)(a1 + 40));

}

- (void)changesReadTo:(BOOL)a3
{
  -[ECMessageFlagChange setRead:](self, "setRead:", a3);
  -[ECMessageFlagChange setReadChanged:](self, "setReadChanged:", 1);
}

- (void)changesDeletedTo:(BOOL)a3
{
  -[ECMessageFlagChange setDeleted:](self, "setDeleted:", a3);
  -[ECMessageFlagChange setDeletedChanged:](self, "setDeletedChanged:", 1);
}

- (void)changesRepliedTo:(BOOL)a3
{
  -[ECMessageFlagChange setReplied:](self, "setReplied:", a3);
  -[ECMessageFlagChange setRepliedChanged:](self, "setRepliedChanged:", 1);
}

- (void)changesFlaggedTo:(BOOL)a3
{
  -[ECMessageFlagChange setFlagged:](self, "setFlagged:", a3);
  -[ECMessageFlagChange setFlaggedChanged:](self, "setFlaggedChanged:", 1);
}

- (void)changesDraftTo:(BOOL)a3
{
  -[ECMessageFlagChange setDraft:](self, "setDraft:", a3);
  -[ECMessageFlagChange setDraftChanged:](self, "setDraftChanged:", 1);
}

- (void)changesForwardedTo:(BOOL)a3
{
  -[ECMessageFlagChange setForwarded:](self, "setForwarded:", a3);
  -[ECMessageFlagChange setForwardedChanged:](self, "setForwardedChanged:", 1);
}

- (void)changesRedirectedTo:(BOOL)a3
{
  -[ECMessageFlagChange setRedirected:](self, "setRedirected:", a3);
  -[ECMessageFlagChange setRedirectedChanged:](self, "setRedirectedChanged:", 1);
}

- (void)changesJunkLevelSetByUserTo:(BOOL)a3
{
  -[ECMessageFlagChange setJunkLevelSetByUser:](self, "setJunkLevelSetByUser:", a3);
  -[ECMessageFlagChange setJunkLevelSetByUserChanged:](self, "setJunkLevelSetByUserChanged:", 1);
}

- (void)changesJunkLevelTo:(unint64_t)a3
{
  -[ECMessageFlagChange setJunkLevel:](self, "setJunkLevel:", a3);
  -[ECMessageFlagChange setJunkLevelChanged:](self, "setJunkLevelChanged:", 1);
}

- (void)changesFlagColorTo:(unint64_t)a3
{
  -[ECMessageFlagChange setFlagColor:](self, "setFlagColor:", a3);
  -[ECMessageFlagChange setFlagColorChanged:](self, "setFlagColorChanged:", 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[ECMessageFlagChange hash](self, "hash");
    v6 = v5 == objc_msgSend(v4, "hash");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint8x8_t v2;
  uint16x4_t v3;
  uint64_t v4;
  uint16x8_t v5;
  uint32x4_t v6;
  uint64x2_t v7;
  uint64x2_t v8;
  uint32x4_t v9;
  uint64x2_t v10;
  uint64x2_t v11;
  int8x16_t v12;

  v2.i32[0] = *(_DWORD *)&self->_deleted;
  v3 = vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v2), (uint16x4_t)0x4000300020001);
  v4 = (v3.i8[0] | v3.i8[4] | ((v3.i32[0] | v3.i32[1]) >> 16) | (32 * self->_forwarded) | (self->_redirected << 6) | (self->_junkLevelSetByUser << 7) | self->_read);
  v5 = vmovl_u8(*(uint8x8_t *)&self->_readChanged);
  v6 = vmovl_u16(*(uint16x4_t *)v5.i8);
  v7.i64[0] = v6.u32[2];
  v7.i64[1] = v6.u32[3];
  v8 = v7;
  v9 = vmovl_high_u16(v5);
  v7.i64[0] = v9.u32[2];
  v7.i64[1] = v9.u32[3];
  v10 = v7;
  v7.i64[0] = v6.u32[0];
  v7.i64[1] = v6.u32[1];
  v11 = v7;
  v7.i64[0] = v9.u32[0];
  v7.i64[1] = v9.u32[1];
  v12 = vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_1B9B33880), (int8x16_t)vshlq_u64(v7, (uint64x2_t)xmmword_1B9B33870)), vorrq_s8((int8x16_t)vshlq_u64(v8, (uint64x2_t)xmmword_1B9B338A0), (int8x16_t)vshlq_u64(v10, (uint64x2_t)xmmword_1B9B33890)));
  return *(_QWORD *)&vorr_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) | ((unint64_t)self->_junkLevelChanged << 21) | ((unint64_t)(self->_junkLevel & 3) << 8) | ((unint64_t)self->_flagColorChanged << 22) | v4 & 0xFFFFFFFFFFFFE3FFLL | ((self->_flagColor & 7) << 10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ECMessageFlagChange)initWithCoder:(id)a3
{
  id v4;
  id v5;
  ECMessageFlagChange *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__ECMessageFlagChange_initWithCoder___block_invoke;
  v8[3] = &unk_1E7121498;
  v9 = v4;
  v5 = v4;
  v6 = -[ECMessageFlagChange initWithBuilder:](self, "initWithBuilder:", v8);

  return v6;
}

void __37__ECMessageFlagChange_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_hash"));
  v4 = v3;
  if ((v3 & 0x2000) != 0)
    objc_msgSend(v5, "changesReadTo:", v3 & 1);
  if ((v4 & 0x4000) != 0)
    objc_msgSend(v5, "changesDeletedTo:", (v4 >> 1) & 1);
  if ((v4 & 0x8000) != 0)
    objc_msgSend(v5, "changesRepliedTo:", (v4 >> 2) & 1);
  if ((v4 & 0x10000) != 0)
    objc_msgSend(v5, "changesFlaggedTo:", (v4 >> 3) & 1);
  if ((v4 & 0x20000) != 0)
    objc_msgSend(v5, "changesDraftTo:", (v4 >> 4) & 1);
  if ((v4 & 0x40000) != 0)
    objc_msgSend(v5, "changesForwardedTo:", (v4 >> 5) & 1);
  if ((v4 & 0x80000) != 0)
    objc_msgSend(v5, "changesRedirectedTo:", (v4 >> 6) & 1);
  if ((v4 & 0x100000) != 0)
    objc_msgSend(v5, "changesJunkLevelSetByUserTo:", (v4 >> 7) & 1);
  if ((v4 & 0x200000) != 0)
    objc_msgSend(v5, "changesJunkLevelTo:", (v4 >> 8) & 3);
  if ((v4 & 0x400000) != 0)
    objc_msgSend(v5, "changesFlagColorTo:", (v4 >> 10) & 7);
  objc_msgSend(v5, "setReason:", (v4 >> 23) & 0xF);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ECMessageFlagChange hash](self, "hash") & 0xFFFFFFFFF87FFFFFLL | ((self->_reason & 0xF) << 23), CFSTR("EFPropertyKey_hash"));

}

- (BOOL)read
{
  return self->_read;
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)replied
{
  return self->_replied;
}

- (void)setReplied:(BOOL)a3
{
  self->_replied = a3;
}

- (BOOL)flagged
{
  return self->_flagged;
}

- (void)setFlagged:(BOOL)a3
{
  self->_flagged = a3;
}

- (BOOL)draft
{
  return self->_draft;
}

- (void)setDraft:(BOOL)a3
{
  self->_draft = a3;
}

- (BOOL)forwarded
{
  return self->_forwarded;
}

- (void)setForwarded:(BOOL)a3
{
  self->_forwarded = a3;
}

- (BOOL)redirected
{
  return self->_redirected;
}

- (void)setRedirected:(BOOL)a3
{
  self->_redirected = a3;
}

- (BOOL)junkLevelSetByUser
{
  return self->_junkLevelSetByUser;
}

- (void)setJunkLevelSetByUser:(BOOL)a3
{
  self->_junkLevelSetByUser = a3;
}

- (unint64_t)junkLevel
{
  return self->_junkLevel;
}

- (void)setJunkLevel:(unint64_t)a3
{
  self->_junkLevel = a3;
}

- (unint64_t)flagColor
{
  return self->_flagColor;
}

- (void)setFlagColor:(unint64_t)a3
{
  self->_flagColor = a3;
}

- (BOOL)readChanged
{
  return self->_readChanged;
}

- (void)setReadChanged:(BOOL)a3
{
  self->_readChanged = a3;
}

- (BOOL)deletedChanged
{
  return self->_deletedChanged;
}

- (void)setDeletedChanged:(BOOL)a3
{
  self->_deletedChanged = a3;
}

- (BOOL)repliedChanged
{
  return self->_repliedChanged;
}

- (void)setRepliedChanged:(BOOL)a3
{
  self->_repliedChanged = a3;
}

- (BOOL)flaggedChanged
{
  return self->_flaggedChanged;
}

- (void)setFlaggedChanged:(BOOL)a3
{
  self->_flaggedChanged = a3;
}

- (BOOL)draftChanged
{
  return self->_draftChanged;
}

- (void)setDraftChanged:(BOOL)a3
{
  self->_draftChanged = a3;
}

- (BOOL)forwardedChanged
{
  return self->_forwardedChanged;
}

- (void)setForwardedChanged:(BOOL)a3
{
  self->_forwardedChanged = a3;
}

- (BOOL)redirectedChanged
{
  return self->_redirectedChanged;
}

- (void)setRedirectedChanged:(BOOL)a3
{
  self->_redirectedChanged = a3;
}

- (BOOL)junkLevelSetByUserChanged
{
  return self->_junkLevelSetByUserChanged;
}

- (void)setJunkLevelSetByUserChanged:(BOOL)a3
{
  self->_junkLevelSetByUserChanged = a3;
}

- (BOOL)junkLevelChanged
{
  return self->_junkLevelChanged;
}

- (void)setJunkLevelChanged:(BOOL)a3
{
  self->_junkLevelChanged = a3;
}

- (BOOL)flagColorChanged
{
  return self->_flagColorChanged;
}

- (void)setFlagColorChanged:(BOOL)a3
{
  self->_flagColorChanged = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

@end
