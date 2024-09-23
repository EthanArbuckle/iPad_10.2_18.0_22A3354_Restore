@implementation _ANSTISPInferencePostprocessorV1

- (_ANSTISPInferencePostprocessorV1)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  _ANSTISPInferencePostprocessorV1 *result;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  result = (_ANSTISPInferencePostprocessorV1 *)objc_msgSend_doesNotRecognizeSelector_(self, v13, (uint64_t)a2);
  __break(1u);
  return result;
}

- (_ANSTISPInferencePostprocessorV1)initWithInferenceDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t **v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  _ANSTISPInferencePostprocessorV1 *v64;
  char v66;
  objc_super v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_configuration(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_useE5(v9, v10, v11))
    v12 = 1278226536;
  else
    v12 = 1278226488;

  objc_msgSend_inputImageDescriptor(v6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v15;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, (uint64_t)v70, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputDescriptors(v6, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_class();
  objc_msgSend__semanticSegmentationMaskDescriptorsForInferenceDescriptor_maskPixelFormatType_(v21, v22, (uint64_t)v6, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v67.receiver = self;
  v67.super_class = (Class)_ANSTISPInferencePostprocessorV1;
  v24 = -[ANSTInferencePostprocessor initWithInferenceInputDescriptors:inferenceOutputDescriptors:processedOutputDescriptors:error:](&v67, sel_initWithInferenceInputDescriptors_inferenceOutputDescriptors_processedOutputDescriptors_error_, v17, v20, v23, a4);

  if (!v24)
    goto LABEL_15;
  objc_msgSend_configuration(v6, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_copy(v27, v28, v29);
  v31 = (void *)*((_QWORD *)v24 + 8);
  *((_QWORD *)v24 + 8) = v30;

  objc_msgSend_inputImageDescriptor(v6, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v34, v35, v36);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)*((_QWORD *)v24 + 9);
  *((_QWORD *)v24 + 9) = v37;

  objc_msgSend_inputImageDescriptor(v6, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v24 + 10) = objc_msgSend_width(v41, v42, v43);

  objc_msgSend_inputImageDescriptor(v6, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v24 + 11) = objc_msgSend_height(v46, v47, v48);

  objc_msgSend_outputDescriptors(v6, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v51, v53, (uint64_t)v52);
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)*((_QWORD *)v24 + 12);
  *((_QWORD *)v24 + 12) = v54;

  v66 = 0;
  v56 = (uint64_t **)(v24 + 104);
  v58 = AcANSTCreate((AcDetNode ***)v24 + 13, (uint64_t)&v66, (uint64_t)(v24 + 2512));
  if ((_DWORD)v58
    || (v58 = AcANSTStart(*v56, (uint64_t)(v24 + 2512)), (_DWORD)v58)
    || (v58 = AcANSTGetParams(*v56, (_DWORD *)v24 + 628, (uint64_t)(v24 + 112)), (_DWORD)v58)
    || (v58 = AcANSTUseLowThresholds(*v56), (_DWORD)v58)
    || (v58 = AcANSTSetRunSaliency(*v56, 1), (_DWORD)v58)
    || (v58 = AcANSTSetRunSaliencyObjectDetection(*v56, 1), (_DWORD)v58)
    || (v58 = AcANSTSetRunViSeg(*v56, 1), (_DWORD)v58))
  {
    if (a4)
    {
      v59 = (void *)MEMORY[0x24BDD1540];
      v68[0] = *MEMORY[0x24BDD0BA0];
      v68[1] = CFSTR("AcReturn");
      v69[0] = CFSTR("Failed to set up AcANST for post-processing.");
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v57, v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v60;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v61, (uint64_t)v69, v68, 2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v59, v63, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v62);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v64 = 0;
  }
  else
  {
LABEL_15:
    v64 = v24;
  }

  return v64;
}

- (void)dealloc
{
  AcANSTContext *det;
  objc_super v4;

  det = self->_det;
  if (det)
  {
    AcANSTStop(det);
    AcANSTDestroy((uint64_t)self->_det);
  }
  v4.receiver = self;
  v4.super_class = (Class)_ANSTISPInferencePostprocessorV1;
  -[_ANSTISPInferencePostprocessorV1 dealloc](&v4, sel_dealloc);
}

- (BOOL)_getInputImageAcOrientation:(int *)a3 withError:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  BOOL v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  int v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_inputPixelBufferForDescriptorNamed_(self, a2, (uint64_t)self->_inferenceInputImageDescriptorName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    switch(objc_msgSend_orientation(v7, v8, v9))
    {
      case 1u:
        *a3 = 0;
        goto LABEL_15;
      case 2u:
      case 4u:
      case 5u:
      case 7u:
        if (!a4)
          goto LABEL_8;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v11, (uint64_t)CFSTR("ANSTErrorDomain"), 17, 0);
        goto LABEL_5;
      case 3u:
        v18 = 2;
        goto LABEL_14;
      case 6u:
        v18 = 3;
LABEL_14:
        *a3 = v18;
LABEL_15:
        v12 = 1;
        break;
      case 8u:
        v12 = 1;
        *a3 = 1;
        break;
      default:
        if (!a4)
          goto LABEL_8;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v11, (uint64_t)CFSTR("ANSTErrorDomain"), 16, 0);
LABEL_5:
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("Missing input pixel buffer for descriptor named: %@"), self->_inferenceInputImageDescriptorName, *MEMORY[0x24BDD0BA0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("ANSTErrorDomain"), 15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_8:
    v12 = 0;
  }

  return v12;
}

- (BOOL)_populateAcANSTNetOutput:(int)a3 intoSegmanticSegmentationMask:(id)a4 withError:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  int v48;
  __CVBuffer *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  void *v64;
  const char *v65;
  _QWORD v67[9];
  int v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend_objectAtIndex_(self->_inferenceOutputTensorDescriptorNames, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputTensorDataForDescriptorNamed_(self, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  if (v12)
  {
    objc_msgSend_tensorDescriptor(v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_dataType(v16, v17, v18);
    if (objc_msgSend_useE5(self->_configuration, v20, v21))
      v24 = 104;
    else
      v24 = 102;
    v25 = objc_msgSend_numberOfDimensions(v16, v22, v23);
    if (v19 == v24)
    {
      v28 = v25;
      v29 = v25 - 2;
      if (v25 < 2)
        goto LABEL_30;
      if (v25 == 2)
        goto LABEL_21;
      v30 = 0;
      v31 = 1;
      do
      {
        while (!v31)
        {
          v31 = 0;
          if (++v30 == v29)
            goto LABEL_30;
        }
        v32 = objc_msgSend_lengthOfDimensionAt_(v16, v26, v30);
        v31 = v32 == 1;
        ++v30;
      }
      while (v30 != v29);
      if (v32 == 1)
      {
LABEL_21:
        v41 = objc_msgSend_lengthOfDimensionAt_(v16, v26, v29);
        v43 = objc_msgSend_lengthOfDimensionAt_(v16, v42, v28 - 1);
        if (objc_msgSend_useE5(self->_configuration, v44, v45))
          v48 = 1278226536;
        else
          v48 = 1278226488;
        v49 = (__CVBuffer *)objc_msgSend_pixelBuffer(v8, v46, v47);
        if (v41 == CVPixelBufferGetHeight(v49)
          && v43 == CVPixelBufferGetWidth(v49)
          && v48 == CVPixelBufferGetPixelFormatType(v49))
        {
          if (!CVPixelBufferLockBaseAddress(v49, 0))
          {
            v67[0] = MEMORY[0x24BDAC760];
            v67[1] = 3221225472;
            v67[2] = sub_2358E96FC;
            v67[3] = &unk_2506E3E88;
            v67[4] = v16;
            v67[5] = v28;
            v68 = v48;
            v67[6] = v49;
            v67[7] = v41;
            v67[8] = v43;
            LOBYTE(a5) = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v15, v52, 0, v67, a5);
            CVPixelBufferUnlockBaseAddress(v49, 0);
            goto LABEL_36;
          }
          if (a5)
          {
            v53 = (void *)MEMORY[0x24BDD1540];
            v69 = *MEMORY[0x24BDD0BA0];
            v70 = CFSTR("Unable to lock pixel CVPixelBuffer for writing.");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v52, (uint64_t)&v70, &v69, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v53, v54, (uint64_t)CFSTR("ANSTErrorDomain"), 19, v35);
            goto LABEL_16;
          }
LABEL_36:

          goto LABEL_37;
        }
        if (!a5)
          goto LABEL_36;
        v55 = (void *)MEMORY[0x24BDD1540];
        v71 = *MEMORY[0x24BDD0BA0];
        v61 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_name(v16, v50, v51);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v61, v62, (uint64_t)CFSTR("Invalid tensor shape for descriptor named: %@"), v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v59;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v63, (uint64_t)&v72, &v71, 1);
      }
      else
      {
LABEL_30:
        if (!a5)
          goto LABEL_36;
        v55 = (void *)MEMORY[0x24BDD1540];
        v73 = *MEMORY[0x24BDD0BA0];
        v56 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_name(v16, v26, v27);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v56, v58, (uint64_t)CFSTR("Invalid tensor shape for descriptor named: %@"), v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v59;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v60, (uint64_t)&v74, &v73, 1);
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v55, v65, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v64);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_35;
    }
    if (a5)
    {
      v37 = (void *)MEMORY[0x24BDD1540];
      v75 = *MEMORY[0x24BDD0BA0];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v26, (uint64_t)CFSTR("Invalid tensor data type for descriptor named: %@"), v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v35;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)&v76, &v75, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v39);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    goto LABEL_36;
  }
  if (a5)
  {
    v33 = (void *)MEMORY[0x24BDD1540];
    v77 = *MEMORY[0x24BDD0BA0];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("Missing input tensor data for descriptor named: %@"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, (uint64_t)v78, &v77, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v36, (uint64_t)CFSTR("ANSTErrorDomain"), 15, v35);
LABEL_16:
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_35:
    LOBYTE(a5) = 0;
    goto LABEL_36;
  }
LABEL_37:

  return (char)a5;
}

- (BOOL)processWithError:(id *)a3
{
  void **v3;
  unsigned int v4;
  _QWORD *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t i;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  unint64_t v32;
  BOOL v34;
  uint64_t v35;
  BOOL v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  int v44;
  const char *v45;
  objc_class *v46;
  _QWORD *v47;
  id v48;
  id v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  id v55;
  char v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  BOOL v64;
  void *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  void *v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  void *v79;
  void *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  int v101;
  ANSTISPAlgorithmResult *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v108;
  void *v109;
  _QWORD *v110;
  void **v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[8];
  __int128 v117;
  __int128 v118;
  float32x2_t v119;
  __int128 v120;
  __int128 v121;
  float32x2_t v122;
  _BYTE v123[128];
  _QWORD v124[5];
  _QWORD v125[5];
  _QWORD v126[2];
  _QWORD v127[2];
  void *v128;
  void **v129;
  uint64_t v130;
  int v131;
  uint64_t v132;
  void *v133;
  _QWORD v134[75];
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  _QWORD v142[4];

  v3 = (void **)MEMORY[0x24BDAC7A8](self, a2);
  v142[1] = *MEMORY[0x24BDAC8D0];
  v121 = 0uLL;
  v122 = 0;
  v4 = *((_DWORD *)v3 + 22);
  LODWORD(v120) = *((_DWORD *)v3 + 20);
  *(_QWORD *)((char *)&v120 + 4) = __PAIR64__(v120, v4);
  HIDWORD(v120) = v4;
  v110 = v5;
  v111 = v3;
  if (!objc_msgSend__getInputImageAcOrientation_withError_(v3, v6, (uint64_t)&v121))
    return 0;
  BYTE5(v121) = objc_msgSend_frameRate(v111[8], v7, v8) == 1;
  *((_QWORD *)&v121 + 1) = 0;
  v122 = vcvt_f32_u32(*(uint32x2_t *)&v120);
  v135 = 0;
  v136 = &v135;
  v137 = 0x524810000000;
  v138 = &unk_23591D839;
  bzero(&v139, 0x5228uLL);
  if (!objc_msgSend_isObjectTrackingEnabled(v111[8], v9, v10))
    goto LABEL_43;
  v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v109 = (void *)objc_msgSend_initWithCapacity_(v13, v14, 25);
  for (i = 0; i != 25; ++i)
  {
    objc_msgSend_objectAtIndex_(v111[12], v15, i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputTensorDataForDescriptorNamed_(v111, v18, (uint64_t)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    if (!v19)
    {
      if (v110)
      {
        v65 = (void *)MEMORY[0x24BDD1540];
        v132 = *MEMORY[0x24BDD0BA0];
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, (uint64_t)CFSTR("Missing input tensor data for descriptor named: %@"), v17);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v66;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v67, (uint64_t)&v133, &v132, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v65, v69, (uint64_t)CFSTR("ANSTErrorDomain"), 15, v68);
        *v110 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_41;
    }
    objc_msgSend_tensorDescriptor(v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_dataType(v23, v24, v25);
    v29 = objc_msgSend_numberOfDimensions(v23, v27, v28);
    v32 = v29;
    v34 = v26 == 104 || v26 == 102;
    v35 = v29 - 1;
    v36 = v34 && v29 > 1;
    if (v34 && (v37 = v29 - 3, v29 >= 3))
    {
      v38 = objc_msgSend_lengthOfDimensionAt_(v23, v30, v29 - 3);
      if (v32 != 3)
      {
        v108 = v17;
        v39 = 0;
        do
          v36 = v36 && objc_msgSend_lengthOfDimensionAt_(v23, v30, v39++) == 1;
        while (v37 != v39);
        v17 = v108;
      }
    }
    else
    {
      v38 = 1;
    }
    if (!v36)
    {
      if (v110)
      {
        v70 = (void *)MEMORY[0x24BDD1540];
        v142[0] = *MEMORY[0x24BDD0BA0];
        v71 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_name(v23, v30, v31);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v71, v73, (uint64_t)CFSTR("Invalid tensor shape for descriptor named: %@"), v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v74;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v75, (uint64_t)&v128, v142, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v70, v77, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v76);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
LABEL_40:

LABEL_41:
      v64 = 0;
      v48 = v109;
      goto LABEL_62;
    }
    v134[3 * i] = 0;
    LODWORD(v134[3 * i + 1]) = objc_msgSend_lengthOfDimensionAt_(v23, v30, v32 - 2) * v38;
    HIDWORD(v134[3 * i + 1]) = objc_msgSend_lengthOfDimensionAt_(v23, v40, v35);
    LODWORD(v134[3 * i + 2]) = objc_msgSend_strideOfDimensionAt_(v23, v41, v32 - 2);
    if (v26 == 102)
    {
      v44 = 6;
    }
    else
    {
      if (v26 != 104)
      {
        if (v110)
        {
          v79 = (void *)MEMORY[0x24BDD1540];
          v140 = *MEMORY[0x24BDD0BA0];
          v80 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_name(v23, v42, v43);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v80, v81, (uint64_t)CFSTR("Invalid tensor data type for descriptor named: %@"), v72);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = v74;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v82, (uint64_t)&v141, &v140, 1);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v79, v83, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v76);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
          *v110 = v78;

        }
        goto LABEL_40;
      }
      v44 = 7;
    }
    HIDWORD(v134[3 * i + 2]) = v44;

    objc_msgSend_addObject_(v109, v45, (uint64_t)v22);
  }
  v128 = 0;
  v129 = &v128;
  v130 = 0x2020000000;
  v131 = 0;
  v116[0] = MEMORY[0x24BDAC760];
  v116[1] = 3221225472;
  v116[2] = sub_2358EA174;
  v116[3] = &unk_2506E3EB0;
  v116[5] = &v128;
  v116[4] = v111;
  v117 = v120;
  v118 = v121;
  v119 = v122;
  v116[6] = &v135;
  v116[7] = v134;
  v46 = (objc_class *)MEMORY[0x24BDD1748];
  v47 = v116;
  v48 = v109;
  v49 = [v46 alloc];
  v51 = (void *)objc_msgSend_initWithOptions_(v49, v50, 258);
  objc_msgSend_objectEnumerator(v48, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v48;

  v56 = sub_2358EA7F0(v54, 0, v51, v47, v110);
  if ((v56 & 1) != 0)
  {
    v58 = *((unsigned int *)v129 + 6);
    if ((_DWORD)v58)
    {
      if (v110)
      {
        v59 = (void *)MEMORY[0x24BDD1540];
        v126[0] = *MEMORY[0x24BDD0BA0];
        v126[1] = CFSTR("AcReturn");
        v127[0] = CFSTR("Failed to perform AcANST post-processing.");
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v57, v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v127[1] = v60;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v61, (uint64_t)v127, v126, 2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v59, v63, (uint64_t)CFSTR("ANSTErrorDomain"), 18, v62);
        *v110 = (id)objc_claimAutoreleasedReturnValue();

        v48 = v55;
      }
      goto LABEL_31;
    }
    _Block_object_dispose(&v128, 8);

LABEL_43:
    if (objc_msgSend_isSegmentationEnabled(v111[8], v11, v12))
    {
      v124[0] = CFSTR("Person");
      v124[1] = CFSTR("SalientPerson");
      v125[0] = &unk_2506EDA98;
      v125[1] = &unk_2506EDAB0;
      v124[2] = CFSTR("Skin");
      v124[3] = CFSTR("Hair");
      v125[2] = &unk_2506EDAC8;
      v125[3] = &unk_2506EDAE0;
      v124[4] = CFSTR("Sky");
      v125[4] = &unk_2506EDAF8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v84, (uint64_t)v125, v124, 5);
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v48 = (id)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v85, (uint64_t)&v112, v123, 16);
      if (v86)
      {
        v87 = *(_QWORD *)v113;
        while (2)
        {
          for (j = 0; j != v86; ++j)
          {
            if (*(_QWORD *)v113 != v87)
              objc_enumerationMutation(v48);
            v89 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j);
            v90 = (void *)objc_opt_class();
            objc_msgSend__semanticSegmentationMaskDescriptorNameOfCategory_(v90, v91, v89);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            if (v93)
            {
              objc_msgSend_outputPixelBufferForDescriptorNamed_(v111, v92, (uint64_t)v93);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              if (v95)
              {
                objc_msgSend_objectForKeyedSubscript_(v48, v94, v89);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = objc_msgSend_intValue(v96, v97, v98);
                v101 = objc_msgSend__populateAcANSTNetOutput_intoSegmanticSegmentationMask_withError_(v111, v100, v99, v95, v110);

                if (!v101)
                {

                  goto LABEL_61;
                }
              }

            }
          }
          v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v92, (uint64_t)&v112, v123, 16);
          if (v86)
            continue;
          break;
        }
      }

    }
    v102 = [ANSTISPAlgorithmResult alloc];
    if (objc_msgSend_isObjectTrackingEnabled(v111[8], v103, v104))
      v106 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v102, v105, (uint64_t)(v136 + 4), 0, 0, 0, 0, 0, 0);
    else
      v106 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v102, v105, 0, 0, 0, 0, 0, 0, 0);
    v48 = v111[25616];
    v111[25616] = (void *)v106;
    v64 = 1;
  }
  else
  {
LABEL_31:
    _Block_object_dispose(&v128, 8);
LABEL_61:
    v64 = 0;
  }
LABEL_62:

  _Block_object_dispose(&v135, 8);
  return v64;
}

- (float)smudgeConfidence
{
  uint64_t v2;
  ANSTISPAlgorithmResult *v3;
  int v4;
  int v5;

  v3 = self->_result;
  if (!v3)
    return NAN;
  v4 = objc_msgSend_smudgeConfidence(v3, a2, v2);
  v5 = v4 & ~(v4 >> 31);
  if (v5 >= 0x3E8)
    v5 = 1000;
  return (float)v5 / 1000.0;
}

- (id)trackedObjectsOfCategory:(id)a3
{
  void *v3;

  v3 = self->_result;
  if (v3)
  {
    objc_msgSend_detectedObjectsForCategory_(v3, a2, (uint64_t)a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)semanticSegmentationMaskDescriptorOfCategory:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  const char *v19;
  char isEqualToString;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend__semanticSegmentationMaskDescriptorNameOfCategory_(v5, v6, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_processedOutputPixelBufferDescriptors(self, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend_name(v17, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)v7);

        if ((isEqualToString & 1) != 0)
        {
          v14 = v17;
          goto LABEL_11;
        }
      }
      v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v22, v26, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  return v14;
}

+ (id)_semanticSegmentationMaskDescriptorNameOfCategory:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("$postprocessed$%@"), a3);
}

+ (id)_semanticSegmentationMaskDescriptorsForInferenceDescriptor:(id)a3 maskPixelFormatType:(unsigned int)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isSegmentationEnabled;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  ANSTPixelBufferDescriptor *v46;
  const char *v47;
  void *v48;
  const char *v49;
  id v51;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_configuration(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(v8, v9, v10);

  if (isSegmentationEnabled)
  {
    objc_msgSend_inputImageDescriptor(v5, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_width(v14, v15, v16);

    v51 = v5;
    objc_msgSend_inputImageDescriptor(v5, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_height(v20, v21, v22);

    v59 = *MEMORY[0x24BDC5668];
    v60[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)v60, &v59, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend__semanticCategories(a1, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_count(v29, v30, v31);
    v34 = (void *)objc_msgSend_initWithCapacity_(v26, v33, v32);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend__semanticCategories(a1, v35, v36);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v54, v58, 16);
    if (v38)
    {
      v40 = v38;
      v41 = v17 >> 1;
      v42 = v23 >> 1;
      v43 = *(_QWORD *)v55;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v55 != v43)
            objc_enumerationMutation(obj);
          objc_msgSend__semanticSegmentationMaskDescriptorNameOfCategory_(a1, v39, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v44));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = [ANSTPixelBufferDescriptor alloc];
          v48 = (void *)objc_msgSend_initWithName_width_height_pixelFormatType_pixelBufferAttributes_error_(v46, v47, (uint64_t)v45, v41, v42, a4, v25, 0);
          objc_msgSend_addObject_(v34, v49, (uint64_t)v48);

          ++v44;
        }
        while (v40 != v44);
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v54, v58, 16);
      }
      while (v40);
    }

    v5 = v51;
  }
  else
  {
    v34 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v34;
}

+ (id)_semanticCategories
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Person");
  v3[1] = CFSTR("SalientPerson");
  v3[2] = CFSTR("Skin");
  v3[3] = CFSTR("Hair");
  v3[4] = CFSTR("Sky");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_inferenceOutputTensorDescriptorNames, 0);
  objc_storeStrong((id *)&self->_inferenceInputImageDescriptorName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
