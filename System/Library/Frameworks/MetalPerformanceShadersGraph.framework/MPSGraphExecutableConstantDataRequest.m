@implementation MPSGraphExecutableConstantDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPSGraphExecutableConstantDataRequest)initWithCoder:(id)a3
{
  id v4;
  MPSGraphExecutableConstantDataRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[MPSGraphExecutableConstantDataRequest initWithCoder:]", "MPSGraphExecutable.mm", 4105, "[coder allowsKeyedCoding]");
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphExecutableConstantDataRequest;
  v5 = -[MPSGraphExecutableConstantDataRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mpsgraphPackageURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraphExecutableConstantDataRequest setMpsgraphPackageURL:](v5, "setMpsgraphPackageURL:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("resourceOffsets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraphExecutableConstantDataRequest setResourceOffsets:](v5, "setResourceOffsets:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[MPSGraphExecutableConstantDataRequest encodeWithCoder:]", "MPSGraphExecutable.mm", 4115, "[coder allowsKeyedCoding]");
  -[MPSGraphExecutableConstantDataRequest mpsgraphPackageURL](self, "mpsgraphPackageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("mpsgraphPackageURL"));

  -[MPSGraphExecutableConstantDataRequest resourceOffsets](self, "resourceOffsets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("resourceOffsets"));

}

- (id)initForMPSGraphPackageAtURL:(id)a3 device:(id)a4 multipleInputTypes:(id)a5 compilationDescriptor:(id)a6 includeConstantDataForNewSpecializations:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  MPSGraphExecutableConstantDataRequest *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  NSDictionary *resourceOffsets;
  MPSGraphExecutableConstantDataRequest *v38;
  MPSGraphPackage *v40;
  id v41;
  MPSGraphDevice *v42;
  id v43;
  void *v44;
  MPSGraphExecutableConstantDataRequest *v45;
  id obj;
  uint64_t v47;
  uint64_t DeviceKey;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _QWORD v61[5];
  _BYTE v62[128];
  void *__dst;
  uint64_t p_dst;
  _QWORD v65[3];
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *__src;
  unsigned int v72;
  uint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v7 = a7;
  v75 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v42 = (MPSGraphDevice *)a4;
  v43 = a5;
  v13 = a6;
  v60.receiver = self;
  v60.super_class = (Class)MPSGraphExecutableConstantDataRequest;
  v14 = -[MPSGraphExecutableConstantDataRequest init](&v60, sel_init);
  v45 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mpsgraphPackageURL, a3);
    v40 = -[MPSGraphPackage initWithSourcePackageURL:]([MPSGraphPackage alloc], "initWithSourcePackageURL:", v41);
    -[MPSGraphPackage getMLIRLibrary](v40, "getMLIRLibrary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "getResourceStorageMode") != 1 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
    objc_msgSend(v44, "getCallablesDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    DeviceKey = getDeviceKey(v42);
    v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (v7)
    {
      objc_msgSend(v44, "getOriginalResourcesUsed");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObjectsFromArray:", v15);

    }
    objc_msgSend(v44, "getOptimizedResourcesUsedLibrary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v43;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
    if (v16)
    {
      v47 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v57 != v47)
            objc_enumerationMutation(obj);
          v18 = *(id *)(*((_QWORD *)&v56 + 1) + 8 * i);
          __dst = 0;
          p_dst = (uint64_t)&__dst;
          v65[0] = 0x3032000000;
          v65[1] = __Block_byref_object_copy__358;
          v65[2] = __Block_byref_object_dispose__359;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
          v66 = (id)objc_claimAutoreleasedReturnValue();
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = ___Z18getShapesFromTypesP7NSArrayIP12MPSGraphTypeE_block_invoke;
          v61[3] = &unk_1E0E770F0;
          v61[4] = &__dst;
          objc_msgSend(v18, "enumerateObjectsUsingBlock:", v61);
          v19 = *(id *)(p_dst + 40);
          _Block_object_dispose(&__dst, 8);

          getFlatShapes(&__src, v19);
          objc_msgSend(v13, "entryFunctionName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v13;
          v22 = v13;
          v23 = v50;
          v24 = v20;
          __dst = v65;
          p_dst = 0x600000000;
          v25 = v72;
          if (v72)
          {
            v26 = v72;
            if (v72 < 7uLL
              || (llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&__dst, v65, v72, 8), (v26 = v72) != 0))
            {
              memcpy(__dst, __src, 8 * v26);
            }
            if (HIDWORD(p_dst) < v25)
              __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
            LODWORD(p_dst) = v25;
          }
          v67 = v22;
          v68 = v23;
          v69 = v24;
          v70 = DeviceKey;

          v13 = v21;
          MPSGraphModuleKeyToJSONString((const MPSGraphModuleKey *)&__dst);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObjectsFromArray:", v28);

          if (__dst != v65)
            free(__dst);
          if (__src != &v73)
            free(__src);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
      }
      while (v16);
    }

    objc_msgSend(v44, "getResourceOffsetsLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
    v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v31 = v51;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v53 != v33)
            objc_enumerationMutation(v31);
          v35 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_msgSend(v29, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            -[NSDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v36, v35);

        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v32);
    }

    resourceOffsets = v45->_resourceOffsets;
    v45->_resourceOffsets = v30;

    v38 = v45;
  }

  return v45;
}

- (NSURL)mpsgraphPackageURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMpsgraphPackageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)resourceOffsets
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResourceOffsets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceOffsets, 0);
  objc_storeStrong((id *)&self->_mpsgraphPackageURL, 0);
}

@end
