@implementation BRCTapToRadarManager

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9
{
  -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:](self, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9 completionHandler:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = a7;
  -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:](self, "requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:", a3, a4, CFSTR("CloudDocs"), CFSTR("All"), 554159, a5, a6, v10, a8, a9, a10);
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12
{
  uint64_t v12;

  LOBYTE(v12) = a10;
  -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:](self, "requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:", a3, a4, a5, a6, a7, a8, a9, v12, a11, a12, 0);
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12 completionHandler:(id)a13
{
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  void *v17;

  if (a13)
    v13 = a13;
  else
    v13 = &__block_literal_global_21;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v13, a2, a3, a4, a5, a6, a7, a8);
  if ((objc_msgSend(MEMORY[0x1E0D10ED0], "isInternalBuild") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:].cold.1((uint64_t)v15, v16);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorNotSupportedInCustomerBuild");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v14)[2](v14, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

- (void)requestTapToRadarWithTitle:(uint64_t)a1 description:(NSObject *)a2 componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not internal build, ignoring tap to radar request%@", (uint8_t *)&v2, 0xCu);
}

@end
