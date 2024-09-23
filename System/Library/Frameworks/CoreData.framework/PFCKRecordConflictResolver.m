@implementation PFCKRecordConflictResolver

- (PFCKRecordConflictResolver)initWithAncestorRecord:(id)a3 serverRecord:(id)a4 clientRecord:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  PFCKRecordConflictResolver *v17;
  NSManagedObjectModel *v18;
  NSEntityDescription *v19;
  objc_class *v20;
  objc_class *v21;
  NSEntityDescription *v22;
  objc_class *v23;
  objc_class *v24;
  NSPersistentContainer *v25;
  void *v26;
  objc_class *v27;
  NSPersistentContainer *v28;
  uint64_t v30;
  objc_super v31;
  _QWORD v32[2];
  uint8_t buf[8];
  NSEntityDescription *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[4];
  const __CFString *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (a3 && (getCloudKitCKShareClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a4 && (getCloudKitCKShareClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a5 && (getCloudKitCKShareClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Conflict resolver only knows how to work with CKShares today.");
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, v30);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Conflict resolver only knows how to work with CKShares today.", buf, 2u);
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)PFCKRecordConflictResolver;
  v17 = -[PFCKRecordConflictResolver init](&v31, sel_init);
  if (v17)
  {
    v17->_ancestorRecord = (CKShare *)a3;
    v17->_serverRecord = (CKShare *)a4;
    v17->_clientRecord = (CKShare *)a5;
    objc_opt_self();
    v18 = objc_alloc_init(NSManagedObjectModel);
    v19 = objc_alloc_init(NSEntityDescription);
    v20 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setName:](v19, "setName:", NSStringFromClass(v20));
    v21 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setManagedObjectClassName:](v19, "setManagedObjectClassName:", NSStringFromClass(v21));
    +[_PFModelUtilities addAttributes:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, &unk_1E1F4A390, v19);
    -[NSEntityDescription setUniquenessConstraints:](v19, "setUniquenessConstraints:", &unk_1E1F52320);
    v22 = objc_alloc_init(NSEntityDescription);
    v23 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setName:](v22, "setName:", NSStringFromClass(v23));
    v24 = (objc_class *)objc_opt_class();
    -[NSEntityDescription setManagedObjectClassName:](v22, "setManagedObjectClassName:", NSStringFromClass(v24));
    +[_PFModelUtilities addAttributes:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, &unk_1E1F4A3B8, v22);
    -[NSEntityDescription setUniquenessConstraints:](v22, "setUniquenessConstraints:", &unk_1E1F52368);
    v41 = CFSTR("participants");
    v40[0] = &unk_1E1F4B4B0;
    v40[1] = v22;
    v40[2] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40[3] = &unk_1E1F4B4C8;
    v42[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
    +[_PFModelUtilities addRelationships:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1), v19);
    v38 = CFSTR("share");
    *(_QWORD *)buf = &unk_1E1F4B4E0;
    v34 = v19;
    v35 = CFSTR("participants");
    v36 = &unk_1E1F4B4F8;
    v37 = &unk_1E1F4B4B0;
    v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 5);
    +[_PFModelUtilities addRelationships:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1), v22);
    v32[0] = v19;
    v32[1] = v22;
    -[NSManagedObjectModel setEntities:](v18, "setEntities:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2));

    v25 = [NSPersistentContainer alloc];
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = (objc_class *)objc_opt_class();
    v28 = -[NSPersistentContainer initWithName:managedObjectModel:](v25, "initWithName:managedObjectModel:", objc_msgSend(v26, "stringWithFormat:", CFSTR("%@-%p"), NSStringFromClass(v27), v17), v18);
    v17->_container = v28;
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[NSPersistentContainer persistentStoreDescriptions](v17->_container, "persistentStoreDescriptions"), "objectAtIndexedSubscript:", 0), "setURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/dev/null/%@"), -[NSPersistentContainer name](v28, "name"))));

    v17->_allParticipantsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17->_participantObjectIDsByParticipantID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  self->_ancestorRecord = 0;
  self->_serverRecord = 0;

  self->_clientRecord = 0;
  self->_resolvedRecord = 0;

  self->_container = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCKRecordConflictResolver;
  -[PFCKRecordConflictResolver dealloc](&v3, sel_dealloc);
}

@end
