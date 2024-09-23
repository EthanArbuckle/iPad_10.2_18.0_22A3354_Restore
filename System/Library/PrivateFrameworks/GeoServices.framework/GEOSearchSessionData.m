@implementation GEOSearchSessionData

- (GEOSearchSessionData)init
{
  GEOSearchSessionData *v2;
  void *v3;
  _QWORD v5[4];
  GEOSearchSessionData *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSearchSessionData;
  v2 = -[GEOSearchSessionData init](&v7, sel_init);
  if (v2)
  {
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __28__GEOSearchSessionData_init__block_invoke;
    v5[3] = &unk_1E1C04548;
    v6 = v2;
    objc_msgSend(v3, "shortSessionValues:", v5);

  }
  return v2;
}

uint64_t __28__GEOSearchSessionData_init__block_invoke(uint64_t result, double a2, double a3)
{
  *(double *)(*(_QWORD *)(result + 32) + 8) = a3;
  return result;
}

- (GEOSearchSessionData)initWithSearchSessionData:(id)a3
{
  id v5;
  GEOSearchSessionData *v6;
  GEOSearchSessionData *v7;

  v5 = a3;
  v6 = -[GEOSearchSessionData init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchSessionData, a3);

  return v7;
}

- (GEOPDSSearchSessionData)searchSessionData
{
  void *v3;
  GEOPDSSearchSessionData *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__GEOSearchSessionData_searchSessionData__block_invoke;
  v6[3] = &unk_1E1C04570;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "shortSessionValues:", v6);

  if (*((_BYTE *)v8 + 24))
    v4 = self->_searchSessionData;
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __41__GEOSearchSessionData_searchSessionData__block_invoke(uint64_t result, double a2, double a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(*(_QWORD *)(result + 32) + 8) == a3;
  return result;
}

- (id)updateWithSearchSessionData:(id)a3
{
  id v4;
  void *v5;
  GEOSearchSessionData *v6;
  GEOSearchSessionData *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__GEOSearchSessionData_updateWithSearchSessionData___block_invoke;
  v9[3] = &unk_1E1C04570;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v5, "shortSessionValues:", v9);

  if (*((_BYTE *)v11 + 24))
    v6 = -[GEOSearchSessionData initWithSearchSessionData:]([GEOSearchSessionData alloc], "initWithSearchSessionData:", v4);
  else
    v6 = objc_alloc_init(GEOSearchSessionData);
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __52__GEOSearchSessionData_updateWithSearchSessionData___block_invoke(uint64_t result, double a2, double a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(*(_QWORD *)(result + 32) + 8) == a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSessionData, 0);
}

@end
