@implementation PHSearchEntityChangeRequest

- (NSString)managedEntityName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D71788], "entityName");
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
  self->_didSetRankingScore = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setSynonyms:(id)a3
{
  objc_storeStrong((id *)&self->_synonyms, a3);
  self->_didSetSynonyms = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (PHSearchEntityChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHSearchEntityChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHSearchEntityChangeRequest;
  v8 = -[PHChangeRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

  }
  return v8;
}

- (void)encodeToXPCDict:(id)a3
{
  void *v4;
  xpc_object_t xdict;

  xdict = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToXPCDict:", xdict);

  if (self->_didSetRankingScore)
    xpc_dictionary_set_double(xdict, "rankingScoreKey", self->_rankingScore);
  if (self->_didSetSynonyms)
    PLXPCDictionarySetArray();

}

- (PHSearchEntityChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHSearchEntityChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHSearchEntityChangeRequest *v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *synonyms;
  _QWORD v21[4];
  PHSearchEntityChangeRequest *v22;
  id v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PHSearchEntityChangeRequest;
  v11 = -[PHChangeRequest init](&v24, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__PHSearchEntityChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
    v21[3] = &unk_1E35DF9E8;
    v14 = v11;
    v22 = v14;
    v23 = v9;
    v15 = (void (**)(_QWORD))_Block_copy(v21);
    xpc_dictionary_get_value(v8, "rankingScoreKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v14->_rankingScore = xpc_double_get_value(v16);
      v14->_didSetRankingScore = 1;
      v15[2](v15);
    }
    PLArrayFromXPCDictionary();
    v18 = objc_claimAutoreleasedReturnValue();
    synonyms = v14->_synonyms;
    v14->_synonyms = (NSArray *)v18;

    if (v14->_synonyms)
    {
      v14->_didSetSynonyms = 1;
      v15[2](v15);
    }

  }
  return v11;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0D71AC0], "newNodeContainerWithNode:", a3, a4, a5);
  v7 = v6;
  if (self->_didSetRankingScore)
    objc_msgSend(v6, "setRankingScore:", self->_rankingScore);
  if (self->_didSetSynonyms)
    objc_msgSend(v7, "setSynonyms:", self->_synonyms);

  return 1;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
}

uint64_t __75__PHSearchEntityChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMutated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "recordUpdateRequest:", *(_QWORD *)(a1 + 32));
}

+ (id)changeRequestForSearchRanking:(id)a3
{
  id v3;
  PHSearchEntityChangeRequest *v4;
  void *v5;
  void *v6;
  PHSearchEntityChangeRequest *v7;

  v3 = a3;
  v4 = [PHSearchEntityChangeRequest alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PHSearchEntityChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);
  return v7;
}

@end
