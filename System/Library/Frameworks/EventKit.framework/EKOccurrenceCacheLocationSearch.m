@implementation EKOccurrenceCacheLocationSearch

- (int)performSearchOperation:(unsigned int)a3 inCalendars:(id)a4 withEventStore:(id)a5 andSearchTerm:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1007;
  objc_msgSend(v10, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CADOperationProxySync");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__EKOccurrenceCacheLocationSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke;
  v15[3] = &unk_1E4784F70;
  v15[4] = &v16;
  objc_msgSend(v13, "CADOccurrenceCacheSearchLocationsWithTerm:inCalendars:responseToken:reply:", v11, v9, v8, v15);

  LODWORD(v8) = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __99__EKOccurrenceCacheLocationSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
