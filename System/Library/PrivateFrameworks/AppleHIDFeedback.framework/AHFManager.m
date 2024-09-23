@implementation AHFManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__AHFManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_sharedInstance;
}

void __28__AHFManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (AHFManager)init
{
  AHFManager *v2;
  uint64_t v3;
  AHFTrackpadController *trackpadController;
  uint64_t v5;
  AHFPencilController *pencilController;
  AHFManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AHFManager;
  v2 = -[AHFManager init](&v9, sel_init);
  if (!v2)
    goto LABEL_5;
  v3 = objc_opt_new();
  trackpadController = v2->_trackpadController;
  v2->_trackpadController = (AHFTrackpadController *)v3;

  if (!v2->_trackpadController)
    goto LABEL_5;
  v5 = objc_opt_new();
  pencilController = v2->_pencilController;
  v2->_pencilController = (AHFPencilController *)v5;

  if (v2->_pencilController)
    v7 = v2;
  else
LABEL_5:
    v7 = 0;

  return v7;
}

- (BOOL)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v10 = a3;
  v16 = -[AHFTrackpadController playFeedback:senderID:timestamp:error:](self->_trackpadController, "playFeedback:senderID:timestamp:error:", v10, a4, a5, a6);
  if (v16 == -536870208)
    v16 = -[AHFPencilController playFeedback:senderID:timestamp:error:](self->_pencilController, "playFeedback:senderID:timestamp:error:", v10, a4, a5, a6);
  if (!a6 || v16)
  {
    if (v16 == -536870208)
      failure(a6, -536870208, (uint64_t)"SenderID 0x%llX not found", v11, v12, v13, v14, v15, a4);
  }
  else
  {
    *a6 = 0;
  }

  return v16 == 0;
}

- (BOOL)playFeedback:(id)a3 powerSourceID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  const __CFArray *v19;
  const __CFArray *v20;
  CFIndex Count;
  CFIndex v22;
  CFIndex v23;
  BOOL v24;
  const void *ValueAtIndex;
  CFDictionaryRef v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  const char *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  unint64_t v49;
  id v50;
  id *v51;

  v10 = a3;
  v11 = a4;
  v12 = (const void *)IOPSCopyPowerSourcesByType();
  if (!v12)
  {
    v31 = "Could not retrieve power sources for accessories";
LABEL_13:
    v32 = failure(a6, -536870212, (uint64_t)v31, v13, v14, v15, v16, v17, v48);
    goto LABEL_26;
  }
  v18 = v12;
  v19 = IOPSCopyPowerSourcesList(v12);
  if (!v19)
  {
    CFRelease(v18);
    v31 = "Could not retrieve power sources list for accessories";
    goto LABEL_13;
  }
  v20 = v19;
  Count = CFArrayGetCount(v19);
  if (Count < 1)
  {
    v24 = 0;
    v30 = -536870212;
    goto LABEL_23;
  }
  v22 = Count;
  v49 = a5;
  v50 = v10;
  v51 = a6;
  v23 = 0;
  v24 = 1;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v20, v23);
    if (!ValueAtIndex)
      goto LABEL_9;
    v26 = IOPSGetPowerSourceDescription(v18, ValueAtIndex);
    if (!v26)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Power Source ID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToNumber:", v11);

    if (v29)
      break;

LABEL_9:
    v24 = ++v23 < v22;
    if (v22 == v23)
    {
      v30 = -536870212;
      goto LABEL_22;
    }
  }
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Accessory Category"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Accessory Identifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "isEqual:", CFSTR("Trackpad")))
  {
    -[AHFManager trackpadController](self, "trackpadController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v33, "isEqual:", CFSTR("Pencil")))
  {
    -[AHFManager pencilController](self, "pencilController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v41 = v35;
    v30 = objc_msgSend(v35, "playFeedback:accessoryID:timestamp:error:", v50, v34, v49, v51);

  }
  else
  {
    v30 = -536870206;
    failure(v51, -536870206, (uint64_t)"Power source category %@ not supported", v36, v37, v38, v39, v40, (uint64_t)v33);
  }

LABEL_22:
  v10 = v50;
  a6 = v51;
LABEL_23:
  CFRelease(v20);
  CFRelease(v18);
  if (!v24)
  {
    v30 = -536870208;
    failure(a6, -536870208, (uint64_t)"Power source with ID %@ not found", v42, v43, v44, v45, v46, (uint64_t)v11);
  }
  v32 = v30 == 0;
LABEL_26:

  return v32;
}

- (AHFTrackpadController)trackpadController
{
  return self->_trackpadController;
}

- (void)setTrackpadController:(id)a3
{
  objc_storeStrong((id *)&self->_trackpadController, a3);
}

- (AHFPencilController)pencilController
{
  return self->_pencilController;
}

- (void)setPencilController:(id)a3
{
  objc_storeStrong((id *)&self->_pencilController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilController, 0);
  objc_storeStrong((id *)&self->_trackpadController, 0);
}

@end
