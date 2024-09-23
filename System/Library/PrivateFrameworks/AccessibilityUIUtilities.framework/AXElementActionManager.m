@implementation AXElementActionManager

- (AXElementActionManager)initWithDragServiceName:(id)a3
{
  id v4;
  AXElementActionManager *v5;
  AXDragManager *v6;
  AXDragManager *dragManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXElementActionManager;
  v5 = -[AXElementActionManager init](&v9, sel_init);
  if (v5)
  {
    v6 = -[AXDragManager initWithMachServiceName:]([AXDragManager alloc], "initWithMachServiceName:", v4);
    dragManager = v5->_dragManager;
    v5->_dragManager = v6;

  }
  return v5;
}

- (AXElementActionManager)initWithDragManager:(id)a3
{
  id v5;
  AXElementActionManager *v6;
  AXElementActionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXElementActionManager;
  v6 = -[AXElementActionManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dragManager, a3);

  return v7;
}

- (BOOL)isDragActive
{
  void *v2;
  char v3;

  -[AXElementActionManager dragManager](self, "dragManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDragActive");

  return v3;
}

- (BOOL)canShowActionsForElement:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = -[AXElementActionManager isDragActive](self, "isDragActive");
  objc_msgSend(v4, "customActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  if (!objc_msgSend(v6, "count") && !v5)
  {
    objc_msgSend(v4, "drags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count") != 0;

  }
  if (-[AXElementActionManager shouldIncludeMedusaActions](self, "shouldIncludeMedusaActions"))
  {
    objc_msgSend(MEMORY[0x1E0CF4EA8], "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowedMedusaGestures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11 || v7;
}

- (id)actionsForElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AXElementAction *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id *v17;
  id *v18;
  id v19;
  id v20;
  AXElementAction *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  AXElementActionManager *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v35 = self;
  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v36 = v3;
  objc_msgSend(v3, "customActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v9);
        v11 = objc_alloc_init(AXElementAction);
        -[AXElementAction setType:](v11, "setType:", 0);
        -[AXElementAction setElement:](v11, "setElement:", v36);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CustomActionName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXElementAction setName:](v11, "setName:", v12);

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CustomActionIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXElementAction setCustomActionIdentifier:](v11, "setCustomActionIdentifier:", v13);

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v7);
  }

  if (-[AXElementActionManager isDragActive](v35, "isDragActive"))
  {
    objc_msgSend(v36, "drops");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXNamesForDrops(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __44__AXElementActionManager_actionsForElement___block_invoke;
    v45[3] = &unk_1E76AB840;
    v16 = &v46;
    v17 = &v47;
    v46 = v36;
    v47 = v15;
    v18 = &v48;
    v19 = v4;
    v48 = v19;
    v20 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v45);
    v21 = objc_alloc_init(AXElementAction);
    -[AXElementAction setType:](v21, "setType:", 3);
    AXUILocalizedStringForKey(CFSTR("CANCEL_DRAG"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXElementAction setName:](v21, "setName:", v22);

    objc_msgSend(v19, "addObject:", v21);
  }
  else
  {
    objc_msgSend(v36, "drags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXNamesForDrags(v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __44__AXElementActionManager_actionsForElement___block_invoke_2;
    v41[3] = &unk_1E76AB840;
    v16 = &v42;
    v17 = &v43;
    v42 = v36;
    v43 = v23;
    v18 = &v44;
    v44 = v4;
    v20 = v23;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v41);
  }

  if (-[AXElementActionManager shouldIncludeMedusaActions](v35, "shouldIncludeMedusaActions"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(MEMORY[0x1E0CF4EA8], "server");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allowedMedusaGestures");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v38;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          v30 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v29), "unsignedIntegerValue", v35);
          v31 = (void *)objc_opt_new();
          objc_msgSend(v31, "setType:", 4);
          objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "userInterfaceLayoutDirection");
          AXSBTitleForMedusaGesture();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setName:", v33);

          objc_msgSend(v31, "setMedusaGesture:", v30);
          objc_msgSend(v4, "addObject:", v31);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v27);
    }

  }
  return v4;
}

void __44__AXElementActionManager_actionsForElement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AXElementActionDropDescriptor *v12;
  double v13;
  double v14;
  double valuePtr;
  double v16;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setType:", 2);
  objc_msgSend(v6, "setElement:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v7);

  valuePtr = 0.0;
  v16 = 0.0;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3FC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXValueGetValue((AXValueRef)v8, kAXValueTypeCGPoint, &valuePtr);
  v13 = 0.0;
  v14 = 0.0;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3FB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AXValueGetValue((AXValueRef)v9, kAXValueTypeCGPoint, &v13);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3FA8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "unsignedIntValue");
  v12 = objc_alloc_init(AXElementActionDropDescriptor);
  -[AXElementActionDropDescriptor setFixedScreenSpacePoint:](v12, "setFixedScreenSpacePoint:", valuePtr, v16);
  -[AXElementActionDropDescriptor setContextSpacePoint:](v12, "setContextSpacePoint:", v13, v14);
  -[AXElementActionDropDescriptor setContextID:](v12, "setContextID:", v11);
  objc_msgSend(v6, "setDropDescriptor:", v12);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void __44__AXElementActionManager_actionsForElement___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setType:", 1);
  objc_msgSend(v7, "setElement:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v6);

  objc_msgSend(v7, "setDragActivationToken:", v5);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

}

- (BOOL)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      objc_msgSend(v4, "element");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "customActionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "performAction:withValue:", 2021, v6);
      goto LABEL_4;
    case 1:
      -[AXElementActionManager dragManager](self, "dragManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "element");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "waitForDragStartFromPid:completionHandler:", objc_msgSend(v9, "pid"), 0);

      objc_msgSend(v4, "element");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXElementActionManager dragManager](self, "dragManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "machServiceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      objc_msgSend(v4, "dragActivationToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "performAction:withValue:", 2050, v12);

LABEL_4:
      goto LABEL_10;
    case 2:
      -[AXElementActionManager dragManager](self, "dragManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dropDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fixedScreenSpacePoint");
      objc_msgSend(v13, "moveToAndDropAtPoint:");

      goto LABEL_8;
    case 3:
      -[AXElementActionManager dragManager](self, "dragManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cancelDrag");
      goto LABEL_8;
    case 4:
      objc_msgSend(MEMORY[0x1E0CF4EA8], "server");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "performMedusaGesture:", objc_msgSend(v4, "medusaGesture"));
LABEL_8:

      break;
    default:
      break;
  }
  v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)shouldIncludeMedusaActions
{
  return self->_shouldIncludeMedusaActions;
}

- (void)setShouldIncludeMedusaActions:(BOOL)a3
{
  self->_shouldIncludeMedusaActions = a3;
}

- (AXDragManager)dragManager
{
  return self->_dragManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
}

@end
