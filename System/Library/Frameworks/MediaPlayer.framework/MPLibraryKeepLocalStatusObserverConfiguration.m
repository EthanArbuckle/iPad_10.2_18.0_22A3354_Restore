@implementation MPLibraryKeepLocalStatusObserverConfiguration

- (void)setIdentifyingModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_identifyingModelObject, a3);
}

- (void)setEnableState:(int64_t)a3
{
  self->_enableState = a3;
}

- (MPModelObject)identifyingModelObject
{
  return self->_identifyingModelObject;
}

- (BOOL)isEqual:(id)a3
{
  MPLibraryKeepLocalStatusObserverConfiguration *v4;
  MPLibraryKeepLocalStatusObserverConfiguration *v5;
  MPModelObject *identifyingModelObject;
  MPModelObject *v7;
  MPModelObject *v8;
  MPModelObject *v9;
  _BOOL4 v10;
  BOOL v11;

  v4 = (MPLibraryKeepLocalStatusObserverConfiguration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[MPLibraryKeepLocalStatusObserverConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      identifyingModelObject = self->_identifyingModelObject;
      v7 = v5->_identifyingModelObject;
      if (identifyingModelObject == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifyingModelObject;
        v10 = -[MPModelObject isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      v11 = self->_enableState == v5->_enableState;
      goto LABEL_10;
    }
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MPModelObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t enableState;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v66 = __ROR8__(v14 + v13, 32);
  v68 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v63 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_identifyingModelObject;
  v19 = -[MPModelObject hash](v18, "hash");
  v20 = (v17 + v63) ^ __ROR8__(v63, 51);
  v21 = v66 + (v68 ^ v19);
  v22 = __ROR8__(v68 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v63, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v67 = __ROR8__(v25, 32);
  v69 = v24;
  v62 = v23 ^ v19;
  v64 = v25 ^ __ROR8__(v20, 47);

  enableState = self->_enableState;
  v27 = (v62 + v64) ^ __ROR8__(v64, 51);
  v28 = v67 + (v69 ^ enableState);
  v29 = __ROR8__(v69 ^ enableState, 48);
  v30 = (v28 ^ v29) + __ROR8__(v62 + v64, 32);
  v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  v32 = v28 + v27;
  v65 = v32 ^ __ROR8__(v27, 47);
  v33 = ((v30 ^ enableState) + v65) ^ __ROR8__(v65, 51);
  v34 = __ROR8__(v32, 32) + (v31 ^ 0x1800000000000000);
  v35 = __ROR8__(v31 ^ 0x1800000000000000, 48);
  v36 = (v34 ^ v35) + __ROR8__((v30 ^ enableState) + v65, 32);
  v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  v38 = v34 + v33;
  v39 = v38 ^ __ROR8__(v33, 47);
  v40 = (v36 ^ 0x1800000000000000) + v39;
  v41 = v40 ^ __ROR8__(v39, 51);
  v42 = (__ROR8__(v38, 32) ^ 0xFFLL) + v37;
  v43 = __ROR8__(v37, 48);
  v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  v46 = v41 + v42;
  v47 = v46 ^ __ROR8__(v41, 47);
  v48 = v47 + v44;
  v49 = v48 ^ __ROR8__(v47, 51);
  v50 = __ROR8__(v46, 32) + v45;
  v51 = __ROR8__(v45, 48);
  v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
  v54 = v49 + v50;
  v55 = v54 ^ __ROR8__(v49, 47);
  v56 = v55 + v52;
  v57 = v56 ^ __ROR8__(v55, 51);
  v58 = __ROR8__(v54, 32) + v53;
  v59 = __ROR8__(v53, 48);
  v60 = __ROR8__(v56, 32) + (v58 ^ v59);
  return (v57 + v58) ^ __ROR8__(v57, 47) ^ v60 ^ __ROR8__(v57 + v58, 32) ^ v60 ^ __ROR8__(v58 ^ v59, 43);
}

- (int64_t)enableState
{
  return self->_enableState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyingModelObject, 0);
}

@end
