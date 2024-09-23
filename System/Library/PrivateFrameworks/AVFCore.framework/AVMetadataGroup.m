@implementation AVMetadataGroup

+ (void)initialize
{
  objc_opt_class();
}

- (NSArray)items
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (opaqueCMFormatDescription)copyFormatDescription
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OSStatus v11;
  signed int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  opaqueCMFormatDescription *v27;
  id v28;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = -[AVMetadataGroup items](self, "items");
  v50 = 0;
  formatDescriptionOut = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v8)
        objc_enumerationMutation(v4);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v9), "_figMetadataSpecificationReturningError:", &v50);
      if (!v10)
        break;
      objc_msgSend(v5, "addObject:", v10);
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, (CFArrayRef)v5, &formatDescriptionOut);
    if (v11 == -16307)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = -[NSArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(", "));
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      v24 = objc_msgSend(v20, "stringWithFormat:", CFSTR("The identifier for one or more of the following items is invalid: %@.  See +[%@ %@] for a way to construct a valid identifier from a key and key space"), v21, v23, NSStringFromSelector(sel_identifierForKey_keySpace_));
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99768];
LABEL_21:
      v19 = (void *)AVErrorForClientProgrammingError(objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v24, 0));
    }
    else
    {
      v12 = v11;
      if (v11 == -12710)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v43;
          v16 = *MEMORY[0x1E0CA2518];
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v43 != v15)
                objc_enumerationMutation(v5);
              v18 = (const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "objectForKey:", v16);
              if (!CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(v18))
              {
                v30 = (void *)MEMORY[0x1E0C99DA0];
                v31 = *MEMORY[0x1E0C99778];
                v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data type \"%@\" does not conform to any built-in data type.  See CMMetadataDataTypeRegistryRegisterDataType."), v18);
                v25 = v30;
                v26 = v31;
                goto LABEL_21;
              }
            }
            v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
            if (v14)
              continue;
            break;
          }
        }
      }
      else if (!v11)
      {
        goto LABEL_24;
      }
      v19 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v12, 0);
    }
    v50 = v19;
  }
LABEL_24:
  v27 = formatDescriptionOut;
  if (!formatDescriptionOut)
  {
    v28 = v50;
    if (objc_msgSend(v50, "code") == -11999)
    {
      v32 = (void *)objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
      v33 = objc_msgSend(v32, "reason");
      v34 = (void *)MEMORY[0x1E0C99DA0];
      v40 = objc_msgSend(v32, "name");
      if (v33)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v33);
      v41 = (void *)objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v40, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot create format description for metadata group %p%@"), v35, v36, v37, v38, v39, (uint64_t)self), 0);
      objc_exception_throw(v41);
    }
  }
  return v27;
}

- (NSString)classifyingLabel
{
  return 0;
}

- (NSString)uniqueID
{
  return 0;
}

@end
