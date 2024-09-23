@implementation MDLMaterialPropertyNode

- (MDLMaterialPropertyNode)initWithInputs:(NSArray *)inputs outputs:(NSArray *)outputs evaluationFunction:(void *)function
{
  NSArray *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id WeakRetained;
  BOOL v16;
  const char *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  BOOL v35;
  const char *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  const char *v41;
  const char *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  const char *v47;
  const char *v48;
  MDLMaterialPropertyNode *v49;
  uint64_t v50;
  NSArray *v51;
  const char *v52;
  uint64_t v53;
  NSArray *v54;
  uint64_t v55;
  id evaluationFunction;
  NSArray *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  NSArray *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  NSMutableArray *v69;
  NSMutableArray *inputNodes;
  MDLMaterialPropertyNode *v71;
  void *v73;
  NSArray *v74;
  NSArray *v75;
  NSArray *obj;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v9 = inputs;
  v75 = outputs;
  v73 = function;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v9;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v90, v97, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v91;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v91 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v13);
        WeakRetained = objc_loadWeakRetained((id *)(v14 + 160));
        v16 = WeakRetained == 0;

        if (!v16)
        {
          v18 = (void *)MEMORY[0x1E0C99DA0];
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v18, v22, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: input cannot be assigned to multiple nodes"), v20, v21);

        }
        if (objc_msgSend_containsObject_(v75, v17, v14))
        {
          v24 = (void *)MEMORY[0x1E0C99DA0];
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v24, v28, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: input appears in output array"), v26, v27);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v90, v97, 16);
    }
    while (v11);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v74 = v75;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v29, (uint64_t)&v86, v96, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v87;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v87 != v31)
          objc_enumerationMutation(v74);
        v33 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v32);
        v34 = objc_loadWeakRetained((id *)(v33 + 160));
        v35 = v34 == 0;

        if (!v35)
        {
          v37 = (void *)MEMORY[0x1E0C99DA0];
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v37, v41, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: output cannot be assigned to multiple nodes"), v39, v40);

        }
        if (objc_msgSend_containsObject_(obj, v36, v33))
        {
          v43 = (void *)MEMORY[0x1E0C99DA0];
          v44 = (objc_class *)objc_opt_class();
          NSStringFromClass(v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v43, v47, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: output appears in input array"), v45, v46);

        }
        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v42, (uint64_t)&v86, v96, 16);
    }
    while (v30);
  }

  v85.receiver = self;
  v85.super_class = (Class)MDLMaterialPropertyNode;
  v49 = -[MDLMaterialPropertyNode init](&v85, sel_init);
  if (v49)
  {
    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v48, (uint64_t)obj);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v49->_inputs;
    v49->_inputs = (NSArray *)v50;

    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v52, (uint64_t)v74);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v49->_outputs;
    v49->_outputs = (NSArray *)v53;

    v55 = MEMORY[0x1DF0D2748](v73);
    evaluationFunction = v49->_evaluationFunction;
    v49->_evaluationFunction = (id)v55;

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v57 = obj;
    v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v81, v95, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v82;
      do
      {
        v61 = 0;
        do
        {
          if (*(_QWORD *)v82 != v60)
            objc_enumerationMutation(v57);
          objc_storeWeak((id *)(*(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v61++) + 160), v49);
        }
        while (v59 != v61);
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v62, (uint64_t)&v81, v95, 16);
      }
      while (v59);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v63 = v74;
    v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v77, v94, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v78;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v78 != v66)
            objc_enumerationMutation(v63);
          objc_storeWeak((id *)(*(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v67++) + 160), v49);
        }
        while (v65 != v67);
        v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v68, (uint64_t)&v77, v94, 16);
      }
      while (v65);
    }

    v69 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inputNodes = v49->_inputNodes;
    v49->_inputNodes = v69;

    v71 = v49;
  }

  return v49;
}

- (void)evaluationFunction
{
  return self->_evaluationFunction;
}

- (void)setEvaluationFunction:(void *)evaluationFunction
{
  objc_setProperty_nonatomic_copy(self, a2, evaluationFunction, 32);
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_evaluationFunction, 0);
  objc_storeStrong((id *)&self->_inputNodes, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
