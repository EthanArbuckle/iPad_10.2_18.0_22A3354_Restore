@implementation GDVisualIdentifierViewPerson

- (id)shortArrayDescription:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    if (objc_msgSend_count(v3, v6, v7) == 1)
    {
      objc_msgSend_firstObject(v3, v8, v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (__CFString *)v3;
    }
    v11 = v10;
  }
  else
  {
    v11 = &stru_1E5DDB0B8;
  }

  return v11;
}

- (id)description
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

  v66 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_entityIdentifier(self, a2, v2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nameComponents(self, v4, v5);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateOfBirth(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)v8;
  if (v8)
    v11 = (const __CFString *)v8;
  else
    v11 = &stru_1E5DDB0B8;
  v63 = v11;
  objc_msgSend_nonGregorianDateOfBirth(self, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v12;
  if (v12)
    v15 = (const __CFString *)v12;
  else
    v15 = &stru_1E5DDB0B8;
  v61 = v15;
  objc_msgSend_anniversary(self, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v70 = (void *)v16;
  if (v16)
    v19 = (const __CFString *)v16;
  else
    v19 = &stru_1E5DDB0B8;
  v60 = v19;
  objc_msgSend_names(self, v17, v18);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v20, (uint64_t)v69);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relatedPeople(self, v21, v22);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v23, (uint64_t)v68);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locations(self, v24, v25);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v26, (uint64_t)v65);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumbers(self, v27, v28);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v29, (uint64_t)v62);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emails(self, v30, v31);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v32, (uint64_t)v59);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactIdentifiers(self, v34, v35);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v36, (uint64_t)v58);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_visualIdentifierObjects(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v41, (uint64_t)v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conversationIdentifiers(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v46, (uint64_t)v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifiers(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortArrayDescription_(self, v51, (uint64_t)v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v66, v53, (uint64_t)CFSTR("<GDVisualIdentifierViewPerson %@, %@, dob: %@ ngdob: %@ an: %@ names: %@ related: %@ loc: %@ phone: %@ email: %@ cnid: %@ vido: %@ cnvid: %@ bndl: %@>"), v64, v74, v63, v61, v60, v73, v57, v56, v55, v33, v37, v42, v47, v52);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (NSArray)conversationIdentifiers
{
  return self->_conversationIdentifiers;
}

- (void)setConversationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_conversationIdentifiers, a3);
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_conversationIdentifiers, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

@end
