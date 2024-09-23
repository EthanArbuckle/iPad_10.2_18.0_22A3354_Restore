@implementation IMCrossServiceAssociationMessageProcessingPipelineComponent

- (IMCrossServiceAssociationMessageProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMCrossServiceAssociationMessageProcessingPipelineComponent *v6;
  IMCrossServiceAssociationMessageProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCrossServiceAssociationMessageProcessingPipelineComponent;
  v6 = -[IMCrossServiceAssociationMessageProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineResources, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "crossServiceDeduplicationMechanism") == 1)
    v5 = (id)*MEMORY[0x1E0D38F70];
  else
    v5 = 0;
  objc_msgSend(v4, "GUID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_34;
  v7 = (void *)v6;
  objc_msgSend(v4, "replacementGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !v5)
    goto LABEL_34;
  -[IMCrossServiceAssociationMessageProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replacementGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageWithGUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMCrossServiceAssociationMessageProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageWithGUID:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMCrossServiceAssociationMessageProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "existingChatForMessageGUID:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v20;
  if ((objc_msgSend(v4, "isFromMe") & 1) != 0)
  {
    v21 = 1;
    if (v16)
    {
LABEL_9:
      objc_msgSend(v16, "sender", v55);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fromDisplayID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", v23) & 1) != 0)
      {
        v24 = 1;
      }
      else if (objc_msgSend(v4, "isFromMe"))
      {
        v24 = objc_msgSend(v16, "isFromMe");
      }
      else
      {
        v24 = 0;
      }

      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(v4, "chat");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v20, "chatIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chat");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "chatIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v26, "isEqualToString:", v28);

      v20 = v55;
    }
    else
    {
      v21 = 0;
    }

    if (v16)
      goto LABEL_9;
  }
  v24 = 0;
LABEL_20:
  if (v20)
    v29 = v21;
  else
    v29 = 0;
  v30 = v29 & v24;
  if (v12
    && (objc_msgSend(v12, "service"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v32 = objc_msgSend(v31, "isEqualToString:", v5),
        v31,
        v20 = v55,
        v32))
  {
    if (v30)
    {
      objc_msgSend(v16, "plainBody");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "plainBody");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqualToString:", v34);

      if (v35)
      {
        -[IMCrossServiceAssociationMessageProcessingPipelineComponent pipelineResources](self, "pipelineResources");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "messageStore");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "guid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "deleteMessageGUIDs:inChat:", v39, v55);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v40, "count"))
        {
          -[IMCrossServiceAssociationMessageProcessingPipelineComponent pipelineResources](self, "pipelineResources");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "broadcaster");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "guid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v43;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v44, 0, 0);

        }
      }
    }
    objc_msgSend(v4, "GUID", v55);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFallbackHash:", v45);

    -[IMCrossServiceAssociationMessageProcessingPipelineComponent pipelineResources](self, "pipelineResources");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "messageStore");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (id)objc_msgSend(v47, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v12, 1, 0, 0, 0);

    v20 = v56;
  }
  else if (v30)
  {
    objc_msgSend(v4, "replacementGUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFallbackHash:", v49);

    objc_msgSend(v16, "setExpectedServiceForCrossServiceReplacement:", v5);
    objc_msgSend(v16, "setService:", v5);
    -[IMCrossServiceAssociationMessageProcessingPipelineComponent pipelineResources](self, "pipelineResources");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "messageStore");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (id)objc_msgSend(v51, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v16, 1, 0, 0, 0);

    v20 = v55;
  }

LABEL_34:
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);

  return v53;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end
