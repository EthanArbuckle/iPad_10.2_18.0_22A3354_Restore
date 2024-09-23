@implementation BCSAVParsingSession

- (BCSAVParsingSession)init
{
  BCSAVParsingSession *v2;
  BCSQRCodeParser *v3;
  BCSQRCodeParser *parser;
  BCSAVParsingSession *v5;
  objc_super v7;
  uint8_t buf[4];
  BCSAVParsingSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)BCSAVParsingSession;
  v2 = -[BCSAVParsingSession init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BCSQRCodeParser);
    parser = v2->_parser;
    v2->_parser = v3;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v2;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSAVParsingSession (%p): Created", buf, 0xCu);
    }
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  BCSAVParsingSession *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[BCSQRCodeParser stopQRCodeParsingSession](self->_parser, "stopQRCodeParsingSession");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v5 = self;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSAVParsingSession (%p): Deallocated", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)BCSAVParsingSession;
  -[BCSAVParsingSession dealloc](&v3, sel_dealloc);
}

- (BOOL)_isLikelyLastScannedObject:(id)a3
{
  NSDictionary *lastScannedCodeBasicDescriptor;

  lastScannedCodeBasicDescriptor = self->_lastScannedCodeBasicDescriptor;
  if (lastScannedCodeBasicDescriptor)
    return objc_msgSend(a3, "_bcs_probablyContainsSameCodeInBasicDescriptor:", lastScannedCodeBasicDescriptor);
  else
    return 0;
}

- (void)_updateSessionWithMetadataObject:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *lastScannedCodeBasicDescriptor;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (!-[BCSAVParsingSession _isLikelyLastScannedObject:](self, "_isLikelyLastScannedObject:", v6))
  {
    objc_msgSend(v6, "basicDescriptor");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    lastScannedCodeBasicDescriptor = self->_lastScannedCodeBasicDescriptor;
    self->_lastScannedCodeBasicDescriptor = v8;

    self->_lastScannedTime = CFAbsoluteTimeGetCurrent();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __74__BCSAVParsingSession__updateSessionWithMetadataObject_completionHandler___block_invoke;
    v15 = &unk_24D787488;
    v17 = v7;
    v10 = v6;
    v16 = v10;
    v11 = (void *)MEMORY[0x219A0C7F8](&v12);
    -[BCSQRCodeParser startQRCodeParsingSessionWithMetadataObject:completionHandler:](self->_parser, "startQRCodeParsingSessionWithMetadataObject:completionHandler:", v10, v11, v12, v13, v14, v15);

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[BCSAVParsingSession _updateSessionWithMetadataObject:completionHandler:].cold.1((uint64_t)self);
    if (!v7)
      goto LABEL_6;
    goto LABEL_4;
  }
  if (v7)
LABEL_4:
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_6:

}

void __74__BCSAVParsingSession__updateSessionWithMetadataObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else if (v6)
  {
    v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_6;
  }

}

- (void)updateSessionWithMetadataObjects:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[BCSAVParsingSession _bestObjectForParsing:](self, "_bestObjectForParsing:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v9, "count") == 1
      && -[BCSAVParsingSession _shouldSkipIncomingObject:](self, "_shouldSkipIncomingObject:", v7))
    {
      if (v6)
        (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    }
    else
    {
      -[BCSAVParsingSession _updateSessionWithMetadataObject:completionHandler:](self, "_updateSessionWithMetadataObject:completionHandler:", v7, v6);
    }
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v8);

  }
}

- (double)_temporalStickyFactorForObject:(id)a3
{
  double Current;
  double v5;

  if (!-[BCSAVParsingSession _isLikelyLastScannedObject:](self, "_isLikelyLastScannedObject:", a3))
    return 1.0;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = Current - self->_lastScannedTime;
  self->_lastScannedTime = Current;
  return fmin(v5 * v5, 1.0);
}

- (BOOL)_shouldSkipIncomingObject:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  NSDictionary *lastScannedCodeBasicDescriptor;
  void *v9;
  int v10;
  uint8_t v11[16];

  objc_msgSend(a3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BDB1EC8];

  if (v4 != v5)
    return 0;
  lastScannedCodeBasicDescriptor = self->_lastScannedCodeBasicDescriptor;
  if (!lastScannedCodeBasicDescriptor)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](lastScannedCodeBasicDescriptor, "objectForKeyedSubscript:", CFSTR("BarcodeType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.AppClipCode"));

  if (!v10 || CFAbsoluteTimeGetCurrent() - self->_lastScannedTime > 0.75)
    return 0;
  v6 = 1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSAVParsingSession: Skipping a QR code since an app clip code was selected a short while ago (< 750ms).", v11, 2u);
  }
  return v6;
}

- (id)_bestObjectForParsing:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v4, "count") <= 2)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0x7FEFFFFFFFFFFFFFLL;
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__BCSAVParsingSession__bestObjectForParsing___block_invoke;
    v7[3] = &unk_24D7874B0;
    v7[4] = self;
    v7[5] = v12;
    v7[6] = &v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    objc_msgSend(v4, "objectAtIndex:", v9[3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(v12, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __45__BCSAVParsingSession__bestObjectForParsing___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(v5, "bounds");
  _bcs_pointToRectDistance(0.5, 0.5, v6, v7, v8, v9);
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "_temporalStickyFactorForObject:", v5);
  v13 = v12;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v11 * v13 < *(double *)(v14 + 24))
  {
    *(double *)(v14 + 24) = v11 * v13;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
}

- (void)updateSessionWithMetadataObjects:(id)a3
{
  -[BCSAVParsingSession updateSessionWithMetadataObjects:completionHandler:](self, "updateSessionWithMetadataObjects:completionHandler:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScannedCodeBasicDescriptor, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

- (void)_updateSessionWithMetadataObject:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "BCSAVParsingSession (%p): Skip processing of same QR code", (uint8_t *)&v1, 0xCu);
}

@end
