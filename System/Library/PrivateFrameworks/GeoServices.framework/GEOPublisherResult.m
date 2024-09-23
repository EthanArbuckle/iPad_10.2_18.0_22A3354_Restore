@implementation GEOPublisherResult

- (GEOPublisherResult)initWithPublisherResult:(id)a3
{
  id *v5;
  GEOPublisherResult *v6;
  void *v7;
  uint64_t v8;
  GEOPDComponent *v9;
  NSObject *p_super;
  GEOPublisherResult *v11;
  uint8_t v13[8];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  objc_super v21;

  v5 = (id *)a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOPublisherResult;
  v6 = -[GEOPublisherResult init](&v21, sel_init);
  if (!v6)
    goto LABEL_7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  -[GEOPDPublisherResult components](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__GEOPublisherResult_initWithPublisherResult___block_invoke;
  v14[3] = &unk_1E1C029D0;
  v14[4] = &v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v8 = v16[5];
  if (v8)
  {
    objc_storeStrong((id *)&v6->_publisherResult, a3);
    v9 = (GEOPDComponent *)(id)v16[5];
    p_super = &v6->_publisherComponent->super.super;
    v6->_publisherComponent = v9;
  }
  else
  {
    GEOGetCuratedCollectionsLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_ERROR, "PublisherResult cannot be initialized, publisherComponent is nil", v13, 2u);
    }
  }

  _Block_object_dispose(&v15, 8);
  if (!v8)
    v11 = 0;
  else
LABEL_7:
    v11 = v6;

  return v11;
}

void __46__GEOPublisherResult_initWithPublisherResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _WORD *v7;
  __int16 v8;
  _WORD *v9;

  v7 = a2;
  if (v7)
  {
    v8 = v7[50];
    if ((v8 & 0x80) != 0 && *((_DWORD *)v7 + 22) == 71 && ((v8 & 0x20) == 0 || !*((_DWORD *)v7 + 20)))
    {
      if (*((_QWORD *)v7 + 2))
      {
        v9 = v7;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
        v7 = v9;
        *a4 = 1;
      }
    }
  }

}

- (GEOPublisher)publisher
{
  GEOPublisher *publisher;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  GEOPDComponent *publisherComponent;
  GEOPublisher *v11;
  void *v12;
  void *v13;
  GEOPublisher *v14;
  GEOPublisher *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  publisher = self->_publisher;
  if (!publisher)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[GEOPDComponent values]((id *)&self->_publisherComponent->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v9)
          {
            if (*(_QWORD *)(v9 + 464))
            {
              publisherComponent = self->_publisherComponent;
              if (publisherComponent)
              {
                if (publisherComponent->_attribution)
                {
                  v11 = [GEOPublisher alloc];
                  -[GEOPDComponentValue publisher]((id *)v9);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GEOPDComponent attribution]((id *)&self->_publisherComponent->super.super.isa);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = -[GEOPublisher initWithPublisher:usingAttribution:](v11, "initWithPublisher:usingAttribution:", v12, v13, (_QWORD)v17);
                  v15 = self->_publisher;
                  self->_publisher = v14;

                  goto LABEL_15;
                }
              }
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

    publisher = self->_publisher;
  }
  return publisher;
}

+ (id)publisherResultsFromResponse:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "mapsResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__GEOPublisherResult_publisherResultsFromResponse___block_invoke;
  v13[3] = &unk_1E1C029F8;
  v14 = v5;
  v8 = v5;
  objc_msgSend(v7, "predicateWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);

  v11 = (void *)objc_msgSend(v8, "copy");
  return v11;
}

uint64_t __51__GEOPublisherResult_publisherResultsFromResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOPublisherResult *v4;
  void *v5;
  GEOPublisherResult *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "resultType") == 3
    && objc_msgSend(v3, "hasPublisher")
    && (v4 = [GEOPublisherResult alloc],
        objc_msgSend(v3, "publisher"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[GEOPublisherResult initWithPublisherResult:](v4, "initWithPublisherResult:", v5),
        v5,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_publisherComponent, 0);
  objc_storeStrong((id *)&self->_publisherResult, 0);
}

@end
