@implementation CRKASMConcreteUserDirectory

- (CRKASMConcreteUserDirectory)initWithRosterRequirements:(id)a3 queryGenerator:(id)a4
{
  id v7;
  id v8;
  CRKASMConcreteUserDirectory *v9;
  CRKASMConcreteUserDirectory *v10;
  uint64_t v11;
  id queryGenerator;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMConcreteUserDirectory;
  v9 = -[CRKASMConcreteUserDirectory init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requirements, a3);
    v11 = MEMORY[0x219A226E8](v8);
    queryGenerator = v10->_queryGenerator;
    v10->_queryGenerator = (id)v11;

  }
  return v10;
}

+ (id)studentDirectoryWithRosterRequirements:(id)a3 locationIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__CRKASMConcreteUserDirectory_studentDirectoryWithRosterRequirements_locationIDs___block_invoke;
  v13[3] = &unk_24D9CAC80;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithRosterRequirements:queryGenerator:", v10, v13);

  return v11;
}

uint64_t __82__CRKASMConcreteUserDirectory_studentDirectoryWithRosterRequirements_locationIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeStudentQueryForSearchString:locationIDs:sortingGivenNameFirst:pageSize:", a2, *(_QWORD *)(a1 + 40), a3, a4);
}

+ (id)instructorDirectoryWithRosterRequirements:(id)a3 locationIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__CRKASMConcreteUserDirectory_instructorDirectoryWithRosterRequirements_locationIDs___block_invoke;
  v13[3] = &unk_24D9CAC80;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithRosterRequirements:queryGenerator:", v10, v13);

  return v11;
}

uint64_t __85__CRKASMConcreteUserDirectory_instructorDirectoryWithRosterRequirements_locationIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeInstructorQueryForSearchString:locationIDs:sortingGivenNameFirst:pageSize:", a2, *(_QWORD *)(a1 + 40), a3, a4);
}

- (id)iteratorForSearchString:(id)a3 sortingGivenNameFirst:(BOOL)a4 pageSize:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  BOOL v16;

  v8 = a3;
  -[CRKASMConcreteUserDirectory requirements](self, "requirements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__CRKASMConcreteUserDirectory_iteratorForSearchString_sortingGivenNameFirst_pageSize___block_invoke;
  v13[3] = &unk_24D9CACA8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = a5;
  v10 = v8;
  +[CRKASMConcreteUserDirectoryIterator iteratorWithRosterRequirements:queryGenerator:](CRKASMConcreteUserDirectoryIterator, "iteratorWithRosterRequirements:queryGenerator:", v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __86__CRKASMConcreteUserDirectory_iteratorForSearchString_sortingGivenNameFirst_pageSize___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "queryGenerator");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (id)queryGenerator
{
  return self->_queryGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryGenerator, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
}

@end
