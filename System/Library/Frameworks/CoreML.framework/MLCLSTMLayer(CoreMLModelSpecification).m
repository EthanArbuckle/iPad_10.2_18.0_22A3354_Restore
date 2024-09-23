@implementation MLCLSTMLayer(CoreMLModelSpecification)

+ (id)uniDirectionalLSTMLayer:()CoreMLModelSpecification error:
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  id v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t *v62;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  _QWORD v94[4];
  _QWORD v95[6];

  v95[4] = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t *)a3[6];
  if (!v6)
    v6 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
  v7 = (uint64_t *)v6[2];
  if (v7)
    v8 = v7;
  else
    v8 = &CoreML::Specification::_WeightParams_default_instance_;
  v92 = 0;
  _validateAndGetData((uint64_t)v8, &v92);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v92;
  if (v9)
  {
    v11 = (uint64_t *)a3[6];
    if (!v11)
      v11 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    v12 = (uint64_t *)v11[3];
    if (v12)
      v13 = v12;
    else
      v13 = &CoreML::Specification::_WeightParams_default_instance_;
    v91 = v10;
    _validateAndGetData((uint64_t)v13, &v91);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v91;

    if (!v77)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v14, CFSTR("Failed to extract forgetGateWeightMatrix."));
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_139;
    }
    v15 = (uint64_t *)a3[6];
    if (!v15)
      v15 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    v16 = (uint64_t *)v15[4];
    if (v16)
      v17 = v16;
    else
      v17 = &CoreML::Specification::_WeightParams_default_instance_;
    v90 = v14;
    _validateAndGetData((uint64_t)v17, &v90);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v90;

    if (!v18)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v19, CFSTR("Failed to extract blockInputWeightMatrix."));
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_138;
    }
    v20 = (uint64_t *)a3[6];
    if (!v20)
      v20 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    v21 = (uint64_t *)v20[5];
    if (v21)
      v22 = v21;
    else
      v22 = &CoreML::Specification::_WeightParams_default_instance_;
    v89 = v19;
    _validateAndGetData((uint64_t)v22, &v89);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v89;

    if (!v23)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v24, CFSTR("Failed to extract outputGateWeightMatrix."));
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_137;
    }
    v95[0] = v9;
    v95[1] = v77;
    v95[2] = v18;
    v95[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (uint64_t *)a3[6];
    if (!v25)
      v25 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    v26 = (uint64_t *)v25[6];
    if (v26)
      v27 = v26;
    else
      v27 = &CoreML::Specification::_WeightParams_default_instance_;
    v88 = v24;
    _validateAndGetData((uint64_t)v27, &v88);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v88;

    if (!v76)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v28, CFSTR("Failed to extract inputGateRecursionMatrix."));
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_136;
    }
    v29 = (uint64_t *)a3[6];
    if (!v29)
      v29 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    v30 = (uint64_t *)v29[7];
    if (v30)
      v31 = v30;
    else
      v31 = &CoreML::Specification::_WeightParams_default_instance_;
    v87 = v28;
    _validateAndGetData((uint64_t)v31, &v87);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v87;

    if (!v75)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v32, CFSTR("Failed to extract forgetGateRecursionMatrix."));
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_135;
    }
    v33 = (uint64_t *)a3[6];
    if (!v33)
      v33 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    v34 = (uint64_t *)v33[8];
    if (v34)
      v35 = v34;
    else
      v35 = &CoreML::Specification::_WeightParams_default_instance_;
    v86 = v32;
    _validateAndGetData((uint64_t)v35, &v86);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v86;

    if (!v73)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v36, CFSTR("Failed to extract blockInputRecursionMatrix."));
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_134;
    }
    v37 = (uint64_t *)a3[6];
    if (!v37)
      v37 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    v38 = (uint64_t *)v37[9];
    if (v38)
      v39 = v38;
    else
      v39 = &CoreML::Specification::_WeightParams_default_instance_;
    v85 = v36;
    _validateAndGetData((uint64_t)v39, &v85);
    v72 = objc_claimAutoreleasedReturnValue();
    v40 = v85;

    v41 = (void *)v72;
    if (!v72)
    {
      if (!a4)
      {
        v44 = 0;
LABEL_133:

        v36 = v40;
LABEL_134:

        v32 = v36;
LABEL_135:

        v28 = v32;
LABEL_136:

        v24 = v28;
LABEL_137:

        v19 = v24;
LABEL_138:

        v14 = v19;
LABEL_139:

        v10 = v14;
        goto LABEL_140;
      }
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v40, CFSTR("Failed to extract outputGateRecursionMatrix."));
      v44 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_132:
      v41 = (void *)v72;
      goto LABEL_133;
    }
    v94[0] = v76;
    v94[1] = v75;
    v94[2] = v73;
    v94[3] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 4);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    v42 = (uint64_t *)a3[6];
    if (v42 && v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
    {
      v43 = v42[10];
      if (v43)
      {
        v84 = v40;
        _validateAndGetData(v43, &v84);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v84;

        if (!v70)
        {
          if (a4)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
            v44 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }
          goto LABEL_131;
        }
        v42 = (uint64_t *)a3[6];
        v40 = v71;
      }
      else
      {
        v70 = 0;
      }
    }
    v45 = 0;
    if (v42 && v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
    {
      v46 = v42[11];
      if (v46)
      {
        v83 = v40;
        _validateAndGetData(v46, &v83);
        v45 = objc_claimAutoreleasedReturnValue();
        v71 = v83;

        if (!v45)
        {
          if (a4)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
            v44 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }
          goto LABEL_130;
        }
        v42 = (uint64_t *)a3[6];
        v40 = v71;
      }
      else
      {
        v45 = 0;
      }
    }
    v47 = 0;
    v67 = (void *)v45;
    if (v42 && v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
    {
      v48 = v42[12];
      if (v48)
      {
        v82 = v40;
        _validateAndGetData(v48, &v82);
        v49 = objc_claimAutoreleasedReturnValue();
        v71 = v82;

        if (!v49)
        {
          if (a4)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
            v44 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }
          goto LABEL_129;
        }
        v47 = (void *)v49;
        v42 = (uint64_t *)a3[6];
        v40 = v71;
        v45 = (uint64_t)v67;
      }
      else
      {
        v47 = 0;
      }
    }
    v50 = 0;
    if (v42)
    {
      if (v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
      {
        v50 = (void *)v42[10];
        if (v50)
        {
          v51 = v47;
          v52 = (uint64_t *)v42[13];
          if (v52)
            v53 = v52;
          else
            v53 = &CoreML::Specification::_WeightParams_default_instance_;
          v81 = v40;
          _validateAndGetData((uint64_t)v53, &v81);
          v54 = objc_claimAutoreleasedReturnValue();
          v71 = v81;

          if (!v54)
          {
            if (a4)
            {
              +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
              v44 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v44 = 0;
            }
LABEL_128:

LABEL_129:
LABEL_130:

LABEL_131:
            v40 = v71;
            goto LABEL_132;
          }
          v50 = (void *)v54;
          v40 = v71;
          v45 = (uint64_t)v67;
          v47 = v51;
        }
      }
    }
    v93[0] = v70;
    v93[1] = v45;
    v51 = v47;
    v93[2] = v47;
    v93[3] = v50;
    v55 = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = *(_QWORD *)(a3[4] + 8);
    v80 = v40;
    _mlcActivationDescriptor(*(_DWORD *)(v56 + 28), &v80);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v80;

    if (v68)
    {
      v57 = *(_QWORD *)(a3[4] + 16);
      v79 = v71;
      _mlcActivationDescriptor(*(_DWORD *)(v57 + 28), &v79);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v79;

      if (v65)
      {
        v59 = *(_QWORD *)(a3[4] + 24);
        v78 = v58;
        _mlcActivationDescriptor(*(_DWORD *)(v59 + 28), &v78);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v78;

        if (v60)
        {
          v62 = (uint64_t *)a3[5];
          if (!v62)
            v62 = &CoreML::Specification::_LSTMParams_default_instance_;
          LOBYTE(v64) = *((_BYTE *)v62 + 20);
          +[MLNeuralNetworkMLComputeLayer uniDirectionalLSTMLayerWithInputSize:outputSize:inputWeightsData:recursionWeightsData:hasBias:biasTermsData:sequenceOutput:inputGateActivation:cellGateActivation:hiddenOutputActivation:](MLNeuralNetworkMLComputeLayer, "uniDirectionalLSTMLayerWithInputSize:outputSize:inputWeightsData:recursionWeightsData:hasBias:biasTermsData:sequenceOutput:inputGateActivation:cellGateActivation:hiddenOutputActivation:", a3[7], a3[8], v74, v69, *((unsigned __int8 *)v62 + 21), v66, v64, v68, v65, v60);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (a4)
        {
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v61, CFSTR("Failed to extract hiddenOutputActivation."));
          v44 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v44 = 0;
        }

        v58 = v61;
      }
      else if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v58, CFSTR("Failed to extract cellGateActivation."));
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }

      v71 = v58;
    }
    else if (a4)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v71, CFSTR("Failed to extract inputGateActivation."));
      v44 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }

    goto LABEL_128;
  }
  if (a4)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v10, CFSTR("Failed to extract inputGateWeightMatrix."));
    v44 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
LABEL_140:

  return v44;
}

@end
