@implementation _PADVNFaceprintDetector

- (_PADVNFaceprintDetector)init
{
  NSObject *v3;
  objc_class *v4;
  id v5;
  dispatch_queue_t v6;
  _PADVNFaceprintDetector *v7;
  uint64_t v8;
  NSMutableArray *faceprints;
  objc_super v11;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), v3);

  v11.receiver = self;
  v11.super_class = (Class)_PADVNFaceprintDetector;
  v7 = -[PADVNSerialRequestsScheduler initWithQueue:](&v11, sel_initWithQueue_, v6);
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    faceprints = v7->_faceprints;
    v7->_faceprints = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_queue, v6);
  }

  return v7;
}

- (void)processFrames:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id completion;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (self->_completion)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0BA0];
    v24[0] = CFSTR("Could not complete faceprint detection on frames because another request is being processed.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v11);

  }
  else
  {
    v12 = _Block_copy(v7);
    completion = self->_completion;
    self->_completion = v12;

    self->_setSize = objc_msgSend(v6, "count");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v6;
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v10);
          -[PADVNSerialRequestsScheduler processFrame:](self, "processFrame:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }
  }

}

- (unint64_t)observationCompositeSetSize
{
  return self->_setSize;
}

- (id)requestsForFrame:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  void *v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213BCD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Vision.ID", ", buf, 2u);
  }

  VNCreateFaceprintRequestInit(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "faces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 == 1)
  {
    objc_msgSend(v6, "faces");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    VNFaceObservationWithAVFoundationFaceBounds(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v29 = v7;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = v10;
      v20 = v10;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v31 == v23)
            {
              v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                goto LABEL_15;
            }
            else
            {
              objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
LABEL_15:
                objc_msgSend(v25, "setUsesCPUOnly:", __52___PADVNFaceprintDetector_requestsForFrame_handler___block_invoke());
                if (!objc_msgSend(v25, "conformsToProtocol:", &unk_254D308F0))
                  continue;
                goto LABEL_16;
              }
            }
            if (!objc_msgSend(v25, "conformsToProtocol:", &unk_254D308F0))
              continue;
LABEL_16:
            v35 = v19;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setInputFaceObservations:", v26);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v22);
      }

      v7 = v29;
      v10 = v28;
    }

  }
  return v10;
}

- (void)handleObservationCompositeError:(id)a3
{
  id v4;
  NSObject *v5;
  void (**completion)(id, id);
  void *v7;
  void *v8;
  uint8_t v9[8];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_213BCD000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Vision.ID", ", v9, 2u);
  }

  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    if (!v4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD0BA0];
      v11[0] = CFSTR("An error occurred when detecting faceprints in the frame.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v8);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      completion = (void (**)(id, id))self->_completion;
    }
    completion[2](completion, v4);
  }

}

- (void)analyzeObservationComposite:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_PADVNFaceprintDetector;
  v4 = a3;
  -[PADVNSerialRequestsScheduler analyzeObservationComposite:](&v15, sel_analyzeObservationComposite_, v4);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    PADVNFaceprintInit(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x24BDBD1A8];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

    -[NSMutableArray addObject:](self->_faceprints, "addObject:", v12);
    v13 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_213BCD000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Vision.ID", ", v14, 2u);
    }
  }
  else
  {
    v13 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_PADVNFaceprintDetector analyzeObservationComposite:].cold.1(v13);
  }

}

- (void)analyzeObservationCompositeSet:(id)a3
{
  void (**completion)(id, _QWORD);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PADVNFaceprintDetector;
  -[PADVNSerialRequestsScheduler analyzeObservationCompositeSet:](&v5, sel_analyzeObservationCompositeSet_, a3);
  completion = (void (**)(id, _QWORD))self->_completion;
  if (completion)
    completion[2](completion, 0);
}

- (void)invalidate
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_213BCD000, log, OS_LOG_TYPE_DEBUG, "Invalidating faceprints.", v1, 2u);
  OUTLINED_FUNCTION_0();
}

- (NSMutableArray)faceprints
{
  return self->_faceprints;
}

- (void)setFaceprints:(id)a3
{
  objc_storeStrong((id *)&self->_faceprints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprints, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)analyzeObservationComposite:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213BCD000, log, OS_LOG_TYPE_ERROR, "Could not obtain faceprint from frame.", v1, 2u);
  OUTLINED_FUNCTION_0();
}

@end
