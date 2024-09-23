@implementation CNContactFetchRequest

- (BOOL)mutableObjects
{
  return self->_mutableObjects;
}

- (NSNumber)keyboardState
{
  return self->_keyboardState;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeysToFetch:", self->_keysToFetch);
  v5 = -[NSPredicate copy](self->_predicate, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  *(_BYTE *)(v4 + 18) = self->_unifyResults;
  *(_BYTE *)(v4 + 23) = self->_alwaysUnifyLabeledValues;
  *(_BYTE *)(v4 + 17) = self->_mutableObjects;
  *(_QWORD *)(v4 + 40) = self->_sortOrder;
  *(_QWORD *)(v4 + 48) = self->_batchSize;
  *(_BYTE *)(v4 + 21) = self->_allowsBatching;
  *(_QWORD *)(v4 + 56) = self->_decoderBatchSize;
  return (id)v4;
}

- (CNContactFetchRequest)initWithKeysToFetch:(NSArray *)keysToFetch
{
  NSArray *v4;
  CNContactFetchRequest *v5;
  uint64_t v6;
  NSArray *v7;
  CNContactFetchRequest *v8;
  objc_super v10;

  v4 = keysToFetch;
  v10.receiver = self;
  v10.super_class = (Class)CNContactFetchRequest;
  v5 = -[CNContactFetchRequest init](&v10, sel_init);
  if (v5)
  {
    v6 = -[NSArray copy](v4, "copy");
    v7 = v5->_keysToFetch;
    v5->_keysToFetch = (NSArray *)v6;

    v5->_unifyResults = 1;
    v5->_alwaysUnifyLabeledValues = 1;
    v5->_sortOrder = 0;
    v5->_serialNumber = objc_msgSend((id)objc_opt_class(), "makeSerialNumber");
    v5->_signpostId = objc_msgSend((id)objc_opt_class(), "makeSignpostId");
    v8 = v5;
  }

  return v5;
}

+ (unint64_t)makeSignpostId
{
  NSObject *v2;
  os_signpost_id_t v3;

  v2 = os_log_create("com.apple.contacts", "api-triage");
  v3 = os_signpost_id_generate(v2);

  return v3;
}

+ (unint64_t)makeSerialNumber
{
  if (makeSerialNumber_cn_once_token_0 != -1)
    dispatch_once(&makeSerialNumber_cn_once_token_0, &__block_literal_global_110);
  return objc_msgSend((id)makeSerialNumber_cn_once_object_0, "nextUnsignedInteger");
}

- (void)setPredicate:(NSPredicate *)predicate
{
  objc_setProperty_nonatomic_copy(self, a2, predicate, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (id)effectiveKeysToFetch
{
  void *v2;
  void *v3;

  if (self->_keysToFetch)
  {
    +[CNContactFetchRequestEffectiveKeyExtender extendRequestedKeys:shouldUnifyResults:sortOrder:](CNContactFetchRequestEffectiveKeyExtender, "extendRequestedKeys:shouldUnifyResults:sortOrder:", self->_keysToFetch, -[CNContactFetchRequest unifyResults](self, "unifyResults"), -[CNContactFetchRequest sortOrder](self, "sortOrder"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CNContactFetchRequestAPIMisuseException"), CFSTR("Do not pass a nil array for keysToFetch"));
    v3 = 0;
  }
  return v3;
}

- (BOOL)unifyResults
{
  return self->_unifyResults;
}

- (CNContactSortOrder)sortOrder
{
  return self->_sortOrder;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (BOOL)disallowsEncodedFetch
{
  return self->_disallowsEncodedFetch;
}

- (int64_t)decoderBatchSize
{
  return self->_decoderBatchSize;
}

- (BOOL)alwaysUnifyLabeledValues
{
  return self->_alwaysUnifyLabeledValues;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (id)effectivePredicate
{
  void *v3;

  -[CNContactFetchRequest predicate](self, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CNContactFetchRequest predicate](self, "predicate");
  else
    +[CNContact predicateForAllContacts](CNContact, "predicateForAllContacts");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitContactFetchRequest:", self);
}

- (BOOL)shouldFailIfAccountNotYetSynced
{
  return self->_shouldFailIfAccountNotYetSynced;
}

- (BOOL)onlyMainStore
{
  return self->_onlyMainStore;
}

- (void)setUnifyResults:(BOOL)unifyResults
{
  self->_unifyResults = unifyResults;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *keysToFetch;
  id v6;

  v4 = a3;
  keysToFetch = self->_keysToFetch;
  v6 = v4;
  if (!keysToFetch)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CNContactFetchRequestAPIMisuseException"), CFSTR("Do not pass a nil array for keysToFetch"));
    v4 = v6;
    keysToFetch = self->_keysToFetch;
  }
  objc_msgSend(v4, "encodeObject:forKey:", keysToFetch, CFSTR("keysToFetch"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_unifyResults, CFSTR("unifyResults"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_alwaysUnifyLabeledValues, CFSTR("alwaysUnifyLabeledValues"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sortOrder, CFSTR("sortOrder"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_onlyMainStore, CFSTR("onlyMainStore"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_mutableObjects, CFSTR("mutableObjects"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_rankSort, CFSTR("rankSort"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_decoderBatchSize, CFSTR("decoderBatchSize"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));

}

- (CNContactFetchRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNContactFetchRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSPredicate *predicate;
  NSObject *v12;
  void *v13;

  v4 = a3;
  +[CNSecureCodingClassSets keyDescriptorClasses](CNSecureCodingClassSets, "keyDescriptorClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("keysToFetch"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[CNContactFetchRequest initWithKeysToFetch:](self, "initWithKeysToFetch:", v6);
    if (v7)
    {
      v7->_unifyResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unifyResults"));
      v7->_alwaysUnifyLabeledValues = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alwaysUnifyLabeledValues"));
      v7->_sortOrder = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sortOrder"));
      v7->_rankSort = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rankSort")) != 0;
      v7->_onlyMainStore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlyMainStore"));
      v7->_mutableObjects = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mutableObjects"));
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("predicate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      predicate = v7->_predicate;
      v7->_predicate = (NSPredicate *)v10;

      v7->_batchSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
      v7->_decoderBatchSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("decoderBatchSize"));
    }
  }
  else
  {
    v12 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNContactFetchRequest initWithCoder:].cold.1(v12);

    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v13);

    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __41__CNContactFetchRequest_makeSerialNumber__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D13988]);
  v1 = (void *)makeSerialNumber_cn_once_object_0;
  makeSerialNumber_cn_once_object_0 = (uint64_t)v0;

}

- (void)setAlwaysUnifyLabeledValues:(BOOL)a3
{
  self->_alwaysUnifyLabeledValues = a3;
}

- (void)setSortOrder:(CNContactSortOrder)sortOrder
{
  self->_sortOrder = sortOrder;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (BOOL)requiresMeContactAuthorization
{
  void *v2;
  void *v3;
  char v4;

  -[CNContactFetchRequest effectivePredicate](self, "effectivePredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact predicateForMeContact](CNContact, "predicateForMeContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)setOnlyMainStore:(BOOL)a3
{
  self->_onlyMainStore = a3;
}

- (CNContactFetchRequest)init
{
  CNContactFetchRequest *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setContactBatchCount:(int64_t)a3
{
  if (self->_contactBatchCount != a3)
  {
    self->_contactBatchCount = a3;
    -[CNContactFetchRequest setBatchSize:](self, "setBatchSize:");
    -[CNContactFetchRequest setDecoderBatchSize:](self, "setDecoderBatchSize:", a3);
  }
}

- (int64_t)contactBatchCount
{
  return self->_contactBatchCount;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFetchRequest predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("predicate"), v4);

  -[CNContactFetchRequest keysToFetch](self, "keysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("keysToFetch"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactFetchRequest unifyResults](self, "unifyResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("unifyResults"), v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNContactFetchRequest sortOrder](self, "sortOrder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("sortOrder"), v10);

  v12 = (id)objc_msgSend(v3, "appendName:u_int64_t:", CFSTR("serialNumber"), self->_serialNumber);
  v13 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("alwaysUnifyLabeledValues"), -[CNContactFetchRequest alwaysUnifyLabeledValues](self, "alwaysUnifyLabeledValues"));
  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)rankSort
{
  return self->_rankSort;
}

- (void)setRankSort:(BOOL)a3
{
  self->_rankSort = a3;
}

- (void)setKeysToFetch:(NSArray *)keysToFetch
{
  objc_setProperty_nonatomic_copy(self, a2, keysToFetch, 32);
}

- (void)setMutableObjects:(BOOL)mutableObjects
{
  self->_mutableObjects = mutableObjects;
}

- (void)setDisallowsEncodedFetch:(BOOL)a3
{
  self->_disallowsEncodedFetch = a3;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (void)setDecoderBatchSize:(int64_t)a3
{
  self->_decoderBatchSize = a3;
}

- (BOOL)allowsBatching
{
  return self->_allowsBatching;
}

- (void)setAllowsBatching:(BOOL)a3
{
  self->_allowsBatching = a3;
}

- (void)setShouldFailIfAccountNotYetSynced:(BOOL)a3
{
  self->_shouldFailIfAccountNotYetSynced = a3;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Error decoding fetch request: no keys to fetch", v1, 2u);
}

@end
