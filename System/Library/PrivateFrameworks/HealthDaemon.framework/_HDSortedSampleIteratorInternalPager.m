@implementation _HDSortedSampleIteratorInternalPager

- (_HDSortedSampleIteratorInternalPager)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

+ (void)getSamplesWithQueryDescriptor:(id)a3 sortDescriptors:(id)a4 anchor:(id)a5 limit:(unint64_t)a6 includeDeletedObjects:(BOOL)a7 profile:(id)a8 resultsHandler:(id)a9
{
  id v13;
  void *v14;
  id v15;
  void **v16;
  void **v17;
  uint64_t *v18;
  uint64_t *v19;
  void **v20;
  id v21;
  id v22;
  void **v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  char v49;
  unint64_t v50;
  void **v51;
  uint64_t v52;
  void **v53;
  void **v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  void **v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v68;
  id v69;
  id v70;
  unint64_t v72;
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  id v77;
  _QWORD v78[3];
  _QWORD v79[7];
  id v80;
  uint64_t *v81;
  void ***v82;
  void ***v83;
  uint64_t *v84;
  SEL v85;
  id v86;
  BOOL v87;
  id v88;
  _QWORD v89[3];
  _QWORD v90[3];
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  void **v96;
  void ***v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  void **v102;
  void ***v103;
  uint64_t v104;
  __n128 (*v105)(__n128 *, __n128 *);
  void (*v106)(uint64_t);
  void *v107;
  _QWORD v108[3];
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  __n128 (*v112)(__n128 *, __n128 *);
  void (*v113)(uint64_t);
  void *v114;
  _QWORD v115[3];
  void **v116[2];

  v69 = a3;
  v70 = a4;
  v13 = a5;
  v68 = a8;
  v65 = a9;
  if (a6 - 101 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HDSortedSampleIteratorInternalPager.mm"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0 && limit <= 100"));

  }
  v72 = a6;
  v63 = v13;
  if (v13)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    if (v70)
      v15 = v70;
    else
      v15 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0CB6C10], "sortedQueryAnchorWithSortDescriptors:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v109 = 0;
  v110 = &v109;
  v111 = 0x4812000000;
  v112 = __Block_byref_object_copy__109;
  v113 = __Block_byref_object_dispose__109;
  v114 = &unk_1B805FAAD;
  memset(v115, 0, sizeof(v115));
  v102 = 0;
  v103 = &v102;
  v104 = 0x4812000000;
  v105 = __Block_byref_object_copy__197;
  v106 = __Block_byref_object_dispose__198;
  v107 = &unk_1B805FAAD;
  memset(v108, 0, sizeof(v108));
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__200;
  v100 = __Block_byref_object_dispose__201;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v101 = v14;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 0;
  v64 = v101;
  v20 = (void **)v101;
  while (1)
  {
    v91 = 0;
    v21 = v68;
    v22 = v69;
    v23 = v20;
    objc_opt_self();
    objc_msgSend(v22, "sampleTypes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSampleEntity entityEnumeratorWithTypes:profile:error:](HDSampleEntity, "entityEnumeratorWithTypes:profile:error:", v24, v21, &v91);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v23, "querySortDescriptors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSortDescriptors:", v26);

      objc_msgSend(v22, "encodingOptions");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = v27;
      else
        v29 = MEMORY[0x1E0C9AA70];
      objc_msgSend(v25, "addEncodingOptionsFromDictionary:", v29);

      objc_msgSend(v22, "restrictedSourceEntities");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setRestrictedSourceEntities:", v30);

      objc_msgSend(v25, "setLimitCount:", v72 - ((((char *)v17 - (char *)v16) >> 4) + (((char *)v19 - (char *)v18) >> 4)));
      objc_msgSend(v22, "authorizationFilter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAuthorizationFilter:", v31);

      objc_msgSend(v22, "samplePredicate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPredicate:", v32);

      objc_msgSend(v22, "deletedObjectsPredicate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDeletedObjectsPredicate:", v33);

      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v23, "predicate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v23, "predicate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v36);

      }
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sampleTypes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "hk_filterRepresentationForDataTypes:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "filter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = (void *)MEMORY[0x1E0CB6F30];
        objc_msgSend(v22, "filter");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "compoundFilterWithFilter:otherFilter:", v39, v42);
        v43 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v43;
      }
      objc_msgSend(v25, "setFilter:", v39);
      objc_msgSend(v23, "objectID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAnchor:", v44);

      v45 = v25;
    }

    v46 = v91;
    v47 = v46;
    if (!v25)
    {
      memset(v90, 0, sizeof(v90));
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v90, (uint64_t *)v110[6], (uint64_t *)v110[7], (v110[7] - v110[6]) >> 4);
      memset(v89, 0, sizeof(v89));
      std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v89, (uint64_t *)v103[6], (uint64_t *)v103[7], ((char *)v103[7] - (char *)v103[6]) >> 4);
      (*((void (**)(id, _QWORD, _QWORD *, _QWORD *, _QWORD, _QWORD, id))v65 + 2))(v65, 0, v90, v89, 0, 0, v47);
      v116[0] = (void **)v89;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);
      v116[0] = (void **)v90;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);
LABEL_34:

      v55 = v64;
      goto LABEL_50;
    }

    v88 = 0;
    v79[3] = MEMORY[0x1E0C809B0];
    v79[4] = 3221225472;
    v79[5] = __144___HDSortedSampleIteratorInternalPager_getSamplesWithQueryDescriptor_sortDescriptors_anchor_limit_includeDeletedObjects_profile_resultsHandler___block_invoke;
    v79[6] = &unk_1E6CFAF48;
    v85 = a2;
    v86 = a1;
    v81 = &v109;
    v82 = &v96;
    v48 = v70;
    v87 = a7;
    v80 = v48;
    v83 = &v102;
    v84 = &v92;
    v49 = objc_msgSend(v25, "enumerateIncludingDeletedObjects:error:handler:");
    v47 = v88;
    if ((v49 & 1) == 0)
    {
      memset(v79, 0, 24);
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v79, (uint64_t *)v110[6], (uint64_t *)v110[7], (v110[7] - v110[6]) >> 4);
      memset(v78, 0, sizeof(v78));
      std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v78, (uint64_t *)v103[6], (uint64_t *)v103[7], ((char *)v103[7] - (char *)v103[6]) >> 4);
      (*((void (**)(id, _QWORD, _QWORD *, _QWORD *, _QWORD, _QWORD, id))v65 + 2))(v65, 0, v79, v78, 0, 0, v47);
      v116[0] = (void **)v78;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);
      v116[0] = (void **)v79;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);
      goto LABEL_33;
    }
    v50 = v72;
    if ((((char *)v103[7] - (char *)v103[6]) >> 4) + ((v110[7] - v110[6]) >> 4) < v72)
    {
      if (a7 || !objc_msgSend(v97[5], "canRelax"))
      {
        v53 = v97[5];
        v97[5] = 0;
      }
      else
      {
        v51 = v97[5];
        v77 = 0;
        objc_msgSend(MEMORY[0x1E0CB6C10], "sortedQueryAnchorRelaxingConstraintsWithAnchor:error:", v51, &v77);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void **)v77;
        v54 = v97[5];
        v97[5] = (void **)v52;

        if (!v97[5])
        {
          memset(v76, 0, sizeof(v76));
          std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v76, (uint64_t *)v110[6], (uint64_t *)v110[7], (v110[7] - v110[6]) >> 4);
          memset(v75, 0, sizeof(v75));
          std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v75, (uint64_t *)v103[6], (uint64_t *)v103[7], ((char *)v103[7] - (char *)v103[6]) >> 4);
          (*((void (**)(id, _QWORD, _QWORD *, _QWORD *, _QWORD, _QWORD, void **))v65 + 2))(v65, 0, v76, v75, 0, 0, v53);
          v116[0] = (void **)v75;
          std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);
          v116[0] = (void **)v76;
          std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);

LABEL_33:
          goto LABEL_34;
        }
      }

      v50 = v72;
    }

    v18 = (uint64_t *)v110[6];
    v19 = (uint64_t *)v110[7];
    v16 = v103[6];
    v17 = v103[7];
    v20 = v97[5];
    if ((((char *)v17 - (char *)v16) >> 4) + (((char *)v19 - (char *)v18) >> 4) >= v50)
      break;
    if (!v20)
      goto LABEL_37;
  }
  if (v20)
  {
    v56 = 0;
    v57 = ((char *)v19 - (char *)v18) >> 4;
    v55 = v64;
  }
  else
  {
LABEL_37:
    if (v19 == v18)
    {
      v55 = v64;
      if (v17 == v16)
      {
        v59 = objc_msgSend(v64, "copy");
      }
      else
      {
        if (v48)
          v60 = v48;
        else
          v60 = (id)MEMORY[0x1E0C9AA60];
        objc_msgSend(MEMORY[0x1E0CB6C10], "sortedQueryAnchorWithSortDescriptors:objectID:", v60, v93[3]);
        v59 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (v48)
        v58 = v48;
      else
        v58 = (id)MEMORY[0x1E0C9AA60];
      v55 = v64;
      objc_msgSend(MEMORY[0x1E0CB6C10], "sortedQueryAnchorWithSortDescriptors:followingSample:objectID:", v58, *(v19 - 1), v93[3]);
      v59 = objc_claimAutoreleasedReturnValue();
    }
    v61 = v97[5];
    v97[5] = (void **)v59;

    v18 = (uint64_t *)v110[6];
    v19 = (uint64_t *)v110[7];
    v57 = ((char *)v19 - (char *)v18) >> 4;
    v56 = 1;
  }
  memset(v74, 0, sizeof(v74));
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v74, v18, v19, v57);
  memset(v73, 0, sizeof(v73));
  std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v73, (uint64_t *)v103[6], (uint64_t *)v103[7], ((char *)v103[7] - (char *)v103[6]) >> 4);
  (*((void (**)(id, uint64_t, _QWORD *, _QWORD *, void **, uint64_t, _QWORD))v65 + 2))(v65, 1, v74, v73, v97[5], v56, 0);
  v116[0] = (void **)v73;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);
  v116[0] = (void **)v74;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v116);
LABEL_50:
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);

  _Block_object_dispose(&v102, 8);
  v96 = (void **)v108;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v96);
  _Block_object_dispose(&v109, 8);
  v102 = (void **)v115;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v102);

}

@end
