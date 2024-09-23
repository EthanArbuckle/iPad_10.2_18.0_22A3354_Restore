@implementation MKPlacePublisherRefiner

- (MKPlacePublisherRefiner)initWithPublisherIdentifier:(unint64_t)a3
{
  return -[MKPlacePublisherRefiner initWithPublisherIdentifier:providerIdentifier:](self, "initWithPublisherIdentifier:providerIdentifier:", a3, 0);
}

- (MKPlacePublisherRefiner)initWithPublisherIdentifier:(unint64_t)a3 providerIdentifier:(int)a4
{
  MKPlacePublisherRefiner *v4;
  uint64_t v5;
  MKPlacePublisherRefiner *v7;
  MKMapItemIdentifier *v8;
  uint64_t v9;
  MKMapItemIdentifier *publisherIdentifier;
  MKPlacePublisherRefiner *v11;
  objc_super v13;
  uint8_t buf[16];

  v4 = self;
  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    v13.receiver = self;
    v13.super_class = (Class)MKPlacePublisherRefiner;
    v7 = -[MKPlacePublisherRefiner init](&v13, sel_init);
    if (v7)
    {
      v8 = [MKMapItemIdentifier alloc];
      v9 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v8, "initWithMUID:resultProviderID:coordinate:", a3, v5, *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8));
      publisherIdentifier = v7->_publisherIdentifier;
      v7->_publisherIdentifier = (MKMapItemIdentifier *)v9;

    }
    v4 = v7;
    v11 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: publisherIdentifier != 0", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)fetchWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MKMapItemIdentifier *publisherIdentifier;
  void *v10;
  void *v11;
  MKMapServicePublisherViewTicket *v12;
  MKMapServicePublisherViewTicket *ticket;
  MKMapServicePublisherViewTicket *v14;
  NSObject *v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Assertion failed: completion != ((void *)0)";
LABEL_9:
    _os_log_fault_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_FAULT, v16, buf, 2u);
    goto LABEL_4;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Assertion failed: callbackQueue != ((void *)0)";
    goto LABEL_9;
  }
  +[MKMapService sharedService](MKMapService, "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  publisherIdentifier = self->_publisherIdentifier;
  +[MKMapService sharedService](MKMapService, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForPublisherViewPublisherIdentifier:keywordFilter:addressFilter:batchSize:withTraits:", publisherIdentifier, 0, 0, 1, v11);
  v12 = (MKMapServicePublisherViewTicket *)objc_claimAutoreleasedReturnValue();
  ticket = self->_ticket;
  self->_ticket = v12;

  v14 = self->_ticket;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__MKPlacePublisherRefiner_fetchWithCallbackQueue_completion___block_invoke;
  v17[3] = &unk_1E20D8C08;
  v18 = v7;
  -[MKMapServicePublisherViewTicket submitWithCallbackQueue:handler:networkActivity:](v14, "submitWithCallbackQueue:handler:networkActivity:", v6, v17, 0);

LABEL_4:
}

void __61__MKPlacePublisherRefiner_fetchWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  id v20;

  v20 = a4;
  v7 = a5;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(CFSTR("Failed to refine publisher for identifier"), "length"))
      objc_msgSend(v8, "setObject:forKey:", CFSTR("Failed to refine publisher for identifier"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v8, "setObject:forKey:", CFSTR("Failed to refine publisher for identifier"), *MEMORY[0x1E0CB3388]);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = MKErrorDomain;
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = v9;
    v13 = v10;
    v14 = 2;
  }
  else
  {
    objc_msgSend(v20, "publisher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v20, "publisher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v15, 0);
      goto LABEL_8;
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(CFSTR("No publisher result for identifier"), "length"))
      objc_msgSend(v8, "setObject:forKey:", CFSTR("No publisher result for identifier"), *MEMORY[0x1E0CB2D50]);
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = MKErrorDomain;
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = v18;
    v13 = v19;
    v14 = 1;
  }
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v15);
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_publisherIdentifier, 0);
}

@end
