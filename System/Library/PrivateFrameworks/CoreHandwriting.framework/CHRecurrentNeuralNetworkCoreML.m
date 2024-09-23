@implementation CHRecurrentNeuralNetworkCoreML

- (CHRecurrentNeuralNetworkCoreML)initWithModelName:(id)a3
{
  id v4;
  CHRecurrentNeuralNetworkCoreML *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _BOOL4 v13;
  size_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t j;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  NSArray *outputNames;
  NSArray *v187;
  NSDictionary *classCounts;
  NSObject *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  id v197;
  void *v198;
  CHRecurrentNeuralNetworkCoreML *v199;
  NSDictionary *v200;
  NSArray *v201;
  NSObject *v202;
  id v203;
  id v204;
  id v205;
  id obj;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  id v215;
  void *__dst[2];
  int64_t v217;
  objc_super v218;
  uint8_t v219[128];
  uint8_t buf[4];
  id v221;
  char __s[1024];
  uint64_t v223;

  v223 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self
    || (v218.receiver = self,
        v218.super_class = (Class)CHRecurrentNeuralNetworkCoreML,
        (v5 = -[CHRecurrentNeuralNetwork initWithModelName:](&v218, sel_initWithModelName_, v4)) == 0))
  {
    v199 = 0;
    goto LABEL_53;
  }
  v199 = v5;
  v197 = v4;
  v6 = objc_retainAutorelease(v4);
  v12 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10, v11);
  v13 = pathForResource(v12, 0, (UInt8 *)__s);
  v14 = strlen(__s);
  if (v14 >= 0x7FFFFFFFFFFFFFF8)
    sub_1BE61F1B4();
  v18 = (void *)v14;
  if (v14 >= 0x17)
  {
    v20 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v20 = v14 | 7;
    v21 = v20 + 1;
    v19 = (void **)operator new(v20 + 1);
    __dst[1] = v18;
    v217 = v21 | 0x8000000000000000;
    __dst[0] = v19;
    goto LABEL_11;
  }
  HIBYTE(v217) = v14;
  v19 = __dst;
  if (v14)
LABEL_11:
    memcpy(v19, __s, (size_t)v18);
  *((_BYTE *)v18 + (_QWORD)v19) = 0;
  if (v217 >= 0)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v15, (uint64_t)__dst, 4, v16, v17);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v15, (uint64_t)__dst[0], 4, v16, v17);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v199->_resourcePath, v198);
  if (v198)
    v26 = v13;
  else
    v26 = 0;
  if (v26)
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v22, (uint64_t)v198, v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x1E0C9E958]);
    v33 = (void *)objc_msgSend_initWithComputeUnits_(v28, v29, 0, v30, v31, v32);
    v215 = 0;
    objc_msgSend_modelWithContentsOfURL_configuration_error_(CHSingletonMLModel, v34, (uint64_t)v27, (uint64_t)v33, (uint64_t)&v215, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v215;
    obj = v36;
    if (v36)
    {

      objc_storeStrong((id *)&v199->_model, v36);
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v38, v39, v40, v41, v42);
      v203 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v43, v44, v45, v46, v47);
      v213 = 0u;
      v214 = 0u;
      v211 = 0u;
      v212 = 0u;
      v202 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_modelDescription(v36, v48, v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_inputDescriptionsByName(v53, v54, v55, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v59, v60, v61, v62, v63, v64);
      v204 = (id)objc_claimAutoreleasedReturnValue();

      v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v65, (uint64_t)&v211, (uint64_t)buf, 16, v66);
      if (v71)
      {
        v72 = *(_QWORD *)v212;
        do
        {
          for (i = 0; i != v71; ++i)
          {
            if (*(_QWORD *)v212 != v72)
              objc_enumerationMutation(v204);
            v74 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * i);
            if (objc_msgSend_hasPrefix_(v74, v67, (uint64_t)CFSTR("input"), v68, v69, v70))
            {
              objc_msgSend_addObject_(v203, v67, (uint64_t)v74, v68, v69, v70);
              objc_msgSend_modelDescription(obj, v75, v76, v77, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_inputDescriptionsByName(v80, v81, v82, v83, v84, v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v86, v87, (uint64_t)v74, v88, v89, v90);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_multiArrayConstraint(v91, v92, v93, v94, v95, v96);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_shape(v97, v98, v99, v100, v101, v102);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndex_(v103, v104, 2, v105, v106, v107);
              v108 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_setObject_forKey_(v202, v109, (uint64_t)v108, (uint64_t)v74, v110, v111);
            }
          }
          v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v67, (uint64_t)&v211, (uint64_t)buf, 16, v70);
        }
        while (v71);
      }

      objc_storeStrong((id *)&v199->_inputNames, v203);
      objc_storeStrong((id *)&v199->_featureCounts, v202);
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v112, v113, v114, v115, v116);
      v201 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v117, v118, v119, v120, v121);
      v200 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v209 = 0u;
      v210 = 0u;
      v207 = 0u;
      v208 = 0u;
      objc_msgSend_modelDescription(obj, v122, v123, v124, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_outputDescriptionsByName(v127, v128, v129, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v133, v134, v135, v136, v137, v138);
      v205 = (id)objc_claimAutoreleasedReturnValue();

      v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v139, (uint64_t)&v207, (uint64_t)v219, 16, v140);
      if (v145)
      {
        v146 = *(_QWORD *)v208;
        do
        {
          for (j = 0; j != v145; ++j)
          {
            if (*(_QWORD *)v208 != v146)
              objc_enumerationMutation(v205);
            v148 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * j);
            if (objc_msgSend_hasPrefix_(v148, v141, (uint64_t)CFSTR("output"), v142, v143, v144))
            {
              objc_msgSend_addObject_(v201, v141, (uint64_t)v148, v142, v143, v144);
              objc_msgSend_modelDescription(obj, v149, v150, v151, v152, v153);
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_outputDescriptionsByName(v154, v155, v156, v157, v158, v159);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v160, v161, (uint64_t)v148, v162, v163, v164);
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_multiArrayConstraint(v165, v166, v167, v168, v169, v170);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_shape(v171, v172, v173, v174, v175, v176);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndex_(v177, v178, 0, v179, v180, v181);
              v182 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_setObject_forKey_(v200, v183, (uint64_t)v182, (uint64_t)v148, v184, v185);
            }
          }
          v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v141, (uint64_t)&v207, (uint64_t)v219, 16, v144);
        }
        while (v145);
      }

      outputNames = v199->_outputNames;
      v199->_outputNames = v201;
      v187 = v201;

      classCounts = v199->_classCounts;
      v199->_classCounts = v200;

      v37 = v202;
      goto LABEL_50;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v189 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v37, v190, v191, v192, v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v221 = v195;
      _os_log_impl(&dword_1BE607000, v189, OS_LOG_TYPE_ERROR, "An error occurred when loading a model: %@", buf, 0xCu);

    }
    obj = 0;
    v203 = v199;
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v37 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v221 = v6;
      _os_log_impl(&dword_1BE607000, v37, OS_LOG_TYPE_ERROR, "Model not found (\"%@\")", buf, 0xCu);
    }
    obj = 0;
    v203 = v199;
  }
  v199 = 0;
LABEL_50:

  if (SHIBYTE(v217) < 0)
    operator delete(__dst[0]);

  v4 = v197;
LABEL_53:

  return v199;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  objc_msgSend_modelKey(self->_model, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_releaseModelWithKey_(CHSingletonMLModel, v8, (uint64_t)v7, v9, v10, v11);

  v12.receiver = self;
  v12.super_class = (Class)CHRecurrentNeuralNetworkCoreML;
  -[CHRecurrentNeuralNetworkCoreML dealloc](&v12, sel_dealloc);
}

- (CHSingletonMLModel)model
{
  return self->_model;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSDictionary)featureCounts
{
  return self->_featureCounts;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSDictionary)classCounts
{
  return self->_classCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classCounts, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_featureCounts, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
