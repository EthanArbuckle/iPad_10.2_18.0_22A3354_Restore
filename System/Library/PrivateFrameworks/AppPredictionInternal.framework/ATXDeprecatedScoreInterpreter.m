@implementation ATXDeprecatedScoreInterpreter

uint64_t __50___ATXDeprecatedScoreInterpreter_instructionCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  void *v19;
  id v20;
  void *v21;
  void (**v22)(id, void *, id);
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void (**v29)(id, void *, id);
  void *v30;
  void *v31;
  _ATXNeuralNetwork *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (**v42)(id, _QWORD, id);
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  _ATXScoreInterpreterCoreMLModel *v75;
  void *v76;
  void *v77;
  void *v78;
  _ATXNeuralNetwork *v79;
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[6];
  _QWORD v91[5];
  _QWORD v92[6];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[4];
  void *v101;
  _QWORD v102[4];
  id v103;
  id v104;
  _QWORD v105[4];
  id v106;
  id v107;
  _QWORD v108[5];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v5, "doubleValue");
      v108[0] = MEMORY[0x1E0C809B0];
      v108[1] = 3221225472;
      v108[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2;
      v108[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
      v108[4] = v8;
      v7 = (void *)objc_msgSend(v108, "copy");
      v9 = _Block_copy(v7);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);

    }
    v10 = _Block_copy(v7);
    objc_msgSend(v6, "addObject:", v10);
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v11 = v5;
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_3;
      v105[3] = &unk_1E82E9358;
      v12 = v11;
      v106 = v12;
      objc_copyWeak(&v107, (id *)(a1 + 56));
      v7 = (void *)objc_msgSend(v105, "copy");
      v13 = _Block_copy(v7);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v12);

      objc_destroyWeak(&v107);
    }
    v10 = _Block_copy(v7);
    objc_msgSend(v6, "addObject:", v10);
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_51:

    return;
  }
  if (objc_msgSend(v5, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 305, CFSTR("Dictionary must be of size 1, not %lu"), objc_msgSend(v5, "count"));

  }
  objc_msgSend(v5, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("IfThenElse")))
  {
    if (objc_msgSend(v10, "count") != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("args.count == 3"));

    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 48);
    v16 = a1 + 48;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v17 + 8) + 40));
    compiledExpressionInstructions(WeakRetained, v78);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)v16 + 8) + 40));
    compiledExpressionInstructions(v20, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void (**)(id, void *, id))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)v16 + 8) + 40));
    v22[2](v22, v76, v6);

    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_4;
    v102[3] = &unk_1E82E9380;
    v103 = v21;
    v104 = v19;
    v23 = v19;
    v24 = v21;
    v25 = (void *)objc_msgSend(v102, "copy");
    v26 = _Block_copy(v25);
    objc_msgSend(v6, "addObject:", v26);

LABEL_20:
LABEL_50:

    goto LABEL_51;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Default")))
  {
    if (objc_msgSend(v10, "count") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v65, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("args.count == 2"));

    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    compiledExpressionInstructions(v27, v78);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void (**)(id, void *, id))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                           + 40));
    v29[2](v29, v76, v6);

    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_5;
    v100[3] = &unk_1E82E93A8;
    v101 = v28;
    v15 = v28;
    v30 = (void *)objc_msgSend(v100, "copy");
    v31 = _Block_copy(v30);
    objc_msgSend(v6, "addObject:", v31);

    v24 = v101;
    goto LABEL_20;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("NeuralNet")))
  {
    v32 = [_ATXNeuralNetwork alloc];
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[_ATXNeuralNetwork initWithData:](v32, "initWithData:", v33);

    objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);
    v34 = objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v77 = 0;
LABEL_27:

    v10 = (id)v34;
    goto LABEL_28;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("IntentInSet")))
  {
    v75 = 0;
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
    v79 = 0;
    v34 = MEMORY[0x1E0C9AA60];
    goto LABEL_27;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("CoreMLModel")))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[_ATXScoreInterpreterCoreMLModel initWithModelName:features:outputSpecification:]([_ATXScoreInterpreterCoreMLModel alloc], "initWithModelName:features:outputSpecification:", v35, v36, v37);
    -[_ATXScoreInterpreterCoreMLModel getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:outputSpecification:](v75, "getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:outputSpecification:", v36, v37);
    v34 = objc_claimAutoreleasedReturnValue();

    v77 = 0;
    v79 = 0;
    v10 = (id)v35;
    goto LABEL_27;
  }
  v75 = 0;
  v77 = 0;
  v79 = 0;
LABEL_28:
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v10 = v10;
  v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v97;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v97 != v39)
          objc_enumerationMutation(v10);
        v41 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * v40);
        v42 = (void (**)(id, _QWORD, id))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                               + 40));
        v42[2](v42, v41, v6);

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
    }
    while (v38);
  }

  v43 = objc_msgSend(v10, "count");
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Sum")))
  {
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_6;
    v95[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v95[4] = v43;
    v44 = (void *)objc_msgSend(v95, "copy");
    v45 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v45);

LABEL_49:
    goto LABEL_50;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Product")))
  {
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_7;
    v94[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v94[4] = v43;
    v44 = (void *)objc_msgSend(v94, "copy");
    v46 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v46);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ValueAtIndexForFeatureArray")))
  {
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_8;
    v93[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v93[4] = v43;
    v44 = (void *)objc_msgSend(v93, "copy");
    v47 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v47);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("NeuralNet")))
  {
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_9;
    v92[3] = &unk_1E82E93D0;
    v92[5] = v43;
    v48 = v92;
    v92[4] = v79;
    v49 = (void *)objc_msgSend(v92, "copy");
    v50 = _Block_copy(v49);
    objc_msgSend(v6, "addObject:", v50);

LABEL_48:
    v44 = (void *)v48[4];
    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("IntentInSet")))
  {
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_10;
    v91[3] = &unk_1E82E93A8;
    v48 = v91;
    v91[4] = v77;
    v51 = (void *)objc_msgSend(v91, "copy");
    v52 = _Block_copy(v51);
    objc_msgSend(v6, "addObject:", v52);

    goto LABEL_48;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("CoreMLModel")))
  {
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11;
    v90[3] = &unk_1E82E93D0;
    v90[5] = v43;
    v48 = v90;
    v90[4] = v75;
    v53 = (void *)objc_msgSend(v90, "copy");
    v54 = _Block_copy(v53);
    objc_msgSend(v6, "addObject:", v54);

    goto LABEL_48;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Logarithm")))
  {
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_54;
    v89[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v89[4] = v43;
    v44 = (void *)objc_msgSend(v89, "copy");
    v55 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v55);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("NatLog")))
  {
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_63;
    v88[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v88[4] = v43;
    v44 = (void *)objc_msgSend(v88, "copy");
    v56 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v56);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Power")))
  {
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_68;
    v87[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v87[4] = v43;
    v44 = (void *)objc_msgSend(v87, "copy");
    v57 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v57);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Divide")))
  {
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_73;
    v86[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v86[4] = v43;
    v44 = (void *)objc_msgSend(v86, "copy");
    v60 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v60);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ExpDecay")))
  {
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_78;
    v85[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v85[4] = v43;
    v44 = (void *)objc_msgSend(v85, "copy");
    v63 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v63);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Threshold")))
  {
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_87;
    v84[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v84[4] = v43;
    v44 = (void *)objc_msgSend(v84, "copy");
    v66 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v66);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("GeometricSum")))
  {
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_90;
    v83[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v83[4] = v43;
    v44 = (void *)objc_msgSend(v83, "copy");
    v67 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v67);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Sigmoid")))
  {
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_97;
    v82[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v82[4] = v43;
    v44 = (void *)objc_msgSend(v82, "copy");
    v68 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v68);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ClampToRange")))
  {
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_100;
    v81[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v81[4] = v43;
    v44 = (void *)objc_msgSend(v81, "copy");
    v69 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v69);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ApplyFeedback")))
  {
    v44 = (void *)objc_msgSend(&__block_literal_global_210, "copy");
    v70 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v70);

    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("RandomUniform")))
  {
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_112;
    v80[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v80[4] = v43;
    v44 = (void *)objc_msgSend(v80, "copy");
    v71 = _Block_copy(v44);
    objc_msgSend(v6, "addObject:", v71);

    goto LABEL_49;
  }
  __atxlog_handle_default();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 627, CFSTR("Undefined function: %@"), v7);

  __break(1u);
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  double v4;
  double v5;
  id WeakRetained;
  double v8;
  char v9;

  v3 = a2;
  v9 = 0;
  objc_msgSend(v3[502], "scoreForKey:found:", *(_QWORD *)(a1 + 32), &v9);
  if (v9 || (objc_msgSend(v3[503], "scoreForKey:found:", *(_QWORD *)(a1 + 32), &v9), v9))
  {
    v5 = v4;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_evalVariable:withCtx:", *(_QWORD *)(a1 + 32), v3);
    v5 = v8;

  }
  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  void **v8;
  double v9;

  v3 = a2;
  pop_0(v3);
  if (v4 == -31337.0)
    goto LABEL_12;
  v5 = (*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v6 = ((*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (v4 >= 0.0)
  {
    v6 = 0;
    v5 = 0;
  }
  if ((*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFLL) == 0)
    v5 = 1;
  v7 = (*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v5;
  if ((*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000)
    v7 = 1;
  if ((v7 | v6) == 1)
LABEL_12:
    v8 = (void **)(a1 + 32);
  else
    v8 = (void **)(a1 + 40);
  v9 = runInstructionsAndPopResult(*v8, v3);

  return v9;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;

  v3 = a2;
  pop_0(v3);
  v5 = v4;
  if (v4 == -31337.0 || (*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    v5 = runInstructionsAndPopResult(*(void **)(a1 + 32), v3);

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  char v5;
  double v6;
  unint64_t v7;
  double v8;

  v3 = a2;
  shouldReturnUndefined_0(v3, *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    drop_0(v3, v4);
    v6 = -31337.0;
  }
  else if (v4)
  {
    v7 = 0;
    v6 = 0.0;
    do
    {
      pop_0(v3);
      v6 = v6 + v8;
      ++v7;
    }
    while (v7 < *(_QWORD *)(a1 + 32));
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  char v5;
  double v6;
  unint64_t v7;
  double v8;

  v3 = a2;
  shouldReturnUndefined_0(v3, *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    drop_0(v3, v4);
    v6 = -31337.0;
  }
  else if (v4)
  {
    v7 = 0;
    v6 = 1.0;
    do
    {
      pop_0(v3);
      v6 = v6 * v8;
      ++v7;
    }
    while (v7 < *(_QWORD *)(a1 + 32));
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_8(uint64_t a1, void *a2)
{
  unint64_t v3;
  _QWORD *v4;
  int v5;
  double v6;
  unint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  shouldReturnUndefined_0(v4, v3);
  if (v5)
  {
    drop_0(v4, *(_QWORD *)(a1 + 32));

    return -31337.0;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(double *)&v4[v4[1] - v7 + 3 + (unint64_t)*(double *)&v4[v4[1] - v7 + 2]];
    drop_0(v4, v7);

  }
  return v6;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_9(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  double v8;

  v3 = a2;
  shouldReturnUndefined_0(v3, *(_QWORD *)(a1 + 40));
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 40));
    v5 = -31337.0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    objc_msgSend(*(id *)(a1 + 32), "predict:", &v3[v7 + 2]);
    v5 = v8;
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_10(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 4032))
    return (double)objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  else
    return 0.0;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  shouldReturnUndefined_0(v3, *(_QWORD *)(a1 + 40));
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 40));
    v5 = -31337.0;
    goto LABEL_26;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasOutputIndexedSubscript"))
  {
    pop_0(v3);
    v7 = (uint64_t)v6;
  }
  else
  {
    v7 = -1;
  }
  v38 = v7;
  v8 = (void *)objc_opt_new();
  v9 = objc_msgSend(*(id *)(a1 + 32), "numberOfFeatures");
  if (!v9)
  {
LABEL_17:
    objc_msgSend(*(id *)(a1 + 32), "predictionForEvaluatedFeatures:withOutputIndexedSubscript:", v8, v38);
    v5 = v22;
    goto LABEL_25;
  }
  v10 = v9;
  v11 = 0;
  v39 = v9;
  v40 = v8;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "featureAtIndex:", v10 + ~v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "featureName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "featureType") == 2)
    {
      pop_0(v3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (objc_msgSend(v12, "featureType") != 5)
      break;
    v41 = v13;
    v15 = objc_msgSend(v12, "multiArraySize");
    v16 = objc_alloc(MEMORY[0x1E0C9E970]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v14 = (void *)objc_msgSend(v16, "initWithShape:dataType:error:", v18, 65600, &v42);
    v19 = v42;

    if (v19)
    {
      __atxlog_handle_default();
      v30 = objc_claimAutoreleasedReturnValue();
      v8 = v40;
      v13 = v41;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_1((uint64_t)v19, v30, v31, v32, v33, v34, v35, v36);

      v5 = -31337.0;
      goto LABEL_24;
    }
    if (v15)
    {
      v20 = v15 - 1;
      do
      {
        pop_0(v3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v21, v20);

        --v20;
      }
      while (v20 != -1);
    }
    v8 = v40;
    v13 = v41;
    v10 = v39;
LABEL_16:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

    if (++v11 == v10)
      goto LABEL_17;
  }
  __atxlog_handle_default();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_2((uint64_t)v13, v23, v24, v25, v26, v27, v28, v29);

  v5 = -31337.0;
LABEL_24:

LABEL_25:
LABEL_26:

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_54(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  long double v9;
  long double v10;
  NSObject *v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(2) == arity"));

  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (!v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    v8 = &v3[v7];
    v10 = *((double *)v8 + 2);
    v9 = *((double *)v8 + 3);
    if (v10 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value > 0"));

    }
    if (v9 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("base > 0"));

    }
    if (v10 <= 0.0)
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.3();
    }
    else
    {
      if (v9 > 0.0)
      {
LABEL_16:
        v12 = log10(v10);
        v5 = v12 / log10(v9);
        goto LABEL_17;
      }
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.2();
    }

    goto LABEL_16;
  }
  drop_0(v3, *(_QWORD *)(a1 + 32));
  v5 = -31337.0;
LABEL_17:

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_63(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  long double v8;
  NSObject *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 495, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(1) == arity"));

  }
  shouldReturnUndefined_0(v3, 1uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
    v5 = -31337.0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    v8 = *(double *)&v3[v7 + 2];
    if (v8 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value > 0"));

      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.5();

    }
    v5 = log(v8);
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_68(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  long double v9;
  long double v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 504, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(2) == arity"));

  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
    v5 = -31337.0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    v8 = &v3[v7];
    v9 = *((double *)v8 + 2);
    v10 = *((double *)v8 + 3);
    if (v9 <= 0.0 && (v9 != 0.0 || v10 <= 0.0) && v10 != (double)(int)v10)
    {
      v14 = *((double *)v8 + 2);
      v15 = *((double *)v8 + 3);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 508, CFSTR("Attempted to compute pow(%f, %f)"), *(_QWORD *)&v14, *(_QWORD *)&v15);

      __atxlog_handle_default();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.6();

      v9 = v14;
      v10 = v15;
    }
    v5 = pow(v9, v10);
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_73(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  double *v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 515, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(2) == arity"));

  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    v8 = (double *)&v3[v7];
    v9 = v8[3];
    if (v9 != 0.0)
    {
      v5 = v8[2] / v9;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("denominator != 0"));

    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_ATXScoreInterpreter _runOperator:arity:context:].cold.4();

  }
  v5 = -31337.0;
LABEL_8:

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_78(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 526, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(3) == arity"));

  }
  shouldReturnUndefined_0(v3, 3uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
LABEL_18:
    v12 = -31337.0;
    goto LABEL_19;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v3[1] - v5;
  drop_0(v3, v5);
  v7 = (double *)&v3[v6];
  v9 = v7[2];
  v8 = v7[3];
  v10 = v7[4];
  if (v9 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("age >= 0"));

  }
  if (v8 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("halflife > 0"));

  }
  if (v9 >= 0.0)
  {
    if (v8 <= 0.0)
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.8();

      goto LABEL_18;
    }
  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_ATXScoreInterpreter _runOperator:arity:context:].cold.7();

  }
  v12 = v10 * exp(v9 * (-0.693147181 / v8));
LABEL_19:

  return v12;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_87(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  void *v9;
  void *v10;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 541, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(2) == arity"));

  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
    v5 = -31337.0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    if (*(double *)&v3[v7 + 2] < *(double *)&v3[v7 + 3])
      v5 = 0.0;
    else
      v5 = 1.0;
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_90(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  double *v7;
  long double v8;
  double v9;
  long double v10;
  NSObject *v11;
  double v12;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 550, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(3) == arity"));

  }
  shouldReturnUndefined_0(v3, 3uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
LABEL_13:
    v12 = -31337.0;
    goto LABEL_14;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v3[1] - v5;
  drop_0(v3, v5);
  v7 = (double *)&v3[v6];
  v8 = v7[2];
  v9 = v7[3];
  v10 = v7[4];
  if (v10 == 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ratio != 1"));

  }
  if (v10 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ratio >= 0"));

  }
  if (v10 == 1.0)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_90_cold_1();

    goto LABEL_13;
  }
  if (v10 < 0.0 && v8 != (double)(int)v8)
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_ATXScoreInterpreter _runOperator:arity:context:].cold.10();

  }
  v12 = v9 * ((1.0 - pow(v10, v8)) / (1.0 - v10));
LABEL_14:

  return v12;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_97(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  double *v8;
  double v9;
  void *v11;
  void *v12;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(3) == arity"));

  }
  shouldReturnUndefined_0(v3, 3uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
    v5 = -31337.0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    v8 = (double *)&v3[v7];
    v9 = v8[3];
    v5 = v9 / (exp(-(v8[4] * v8[2])) + 1.0);
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_100(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 581, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(4) == arity"));

  }
  shouldReturnUndefined_0(v3, 4uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
    v5 = -31337.0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    v8 = (double *)&v3[v7];
    v10 = v8[2];
    v9 = v8[3];
    v12 = v8[4];
    v11 = v8[5];
    if (v9 > v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 586, CFSTR("ClampToRange: minVal (%f) must be <= defaultVal (%f) "), *(_QWORD *)&v9, *(_QWORD *)&v11);

    }
    if (v11 > v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 587, CFSTR("ClampToRange: defaultVal (%f) must be <= maxVal (%f) "), *(_QWORD *)&v11, *(_QWORD *)&v12);

    }
    v13 = v10;
    if (v10 < v9)
      v13 = v9;
    if (v13 >= v12)
      v5 = v12;
    else
      v5 = v13;
    if (v5 != v10)
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        v23 = v10;
        v24 = 2048;
        v25 = v9;
        v26 = 2048;
        v27 = v12;
        v28 = 2048;
        v29 = v11;
        v30 = 2048;
        v31 = v5;
        _os_log_debug_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEBUG, "ClampToRange(input=%f, min=%f, max=%f, default=%f): input coerced to %f", buf, 0x34u);
      }

    }
  }

  return v5;
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_109(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  pop_0(v2);
  pop_0(v2);

}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_112(uint64_t a1, void *a2)
{
  _QWORD *v3;
  int v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  double *v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(2) == arity"));

  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(_QWORD *)(a1 + 32));
    v5 = -31337.0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v3[1] - v6;
    drop_0(v3, v6);
    v8 = (double *)&v3[v7];
    v9 = v8[2];
    v10 = v8[3];
    if (v9 > v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 618, CFSTR("RandomUniform: start (%f) must be <= end (%f) "), *(_QWORD *)&v9, *(_QWORD *)&v10);

    }
    v5 = v9 + (v10 - v9) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0);
  }

  return v5;
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Undefined function", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ScoreInterpreter - CoreMLModel - Error in initializing MLMultiArray: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ScoreInterpreter - CoreMLModel - input feature with name %@ is not of type Double or MLMultiArray", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_90_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Attempted to compute GeometricSum with a ratio of 1 -- setting output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
