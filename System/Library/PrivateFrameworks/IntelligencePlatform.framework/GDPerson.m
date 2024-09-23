@implementation GDPerson

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  unsigned int isFavorite;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_entityIdentifier(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nameComponents(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v8;
  if (v8)
    v12 = (const __CFString *)v8;
  else
    v12 = &stru_1E5DDB0B8;
  objc_msgSend_dateOfBirth(self, v9, v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v13;
  if (v13)
    v17 = (const __CFString *)v13;
  else
    v17 = &stru_1E5DDB0B8;
  objc_msgSend_names(self, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v18, v19, (uint64_t)CFSTR("|"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isFavorite = objc_msgSend_isFavorite(self, v21, v22);
  v26 = objc_msgSend_type(self, v24, v25);
  objc_msgSend_stringWithFormat_(v4, v27, (uint64_t)CFSTR("<GDPerson %@, %@, dob:%@, ns:%@, f:%d, t:%td>"), v5, v12, v17, v20, isFavorite, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSArray)names
{
  return self->_names;
}

- (GDPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSArray)postalAddressLinks
{
  return self->_postalAddressLinks;
}

- (NSArray)softwareLinks
{
  return self->_softwareLinks;
}

- (NSArray)relatedPeople
{
  return self->_relatedPeople;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emails
{
  return self->_emails;
}

- (NSDateComponents)dateOfBirth
{
  return self->_dateOfBirth;
}

- (NSDateComponents)nonGregorianDateOfBirth
{
  return self->_nonGregorianDateOfBirth;
}

- (NSDateComponents)anniversary
{
  return self->_anniversary;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (NSArray)customIdentifiers
{
  return self->_customIdentifiers;
}

- (NSArray)visualIdentifiers
{
  return self->_visualIdentifiers;
}

- (NSArray)visualIdentifierObjects
{
  return self->_visualIdentifierObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentifierObjects, 0);
  objc_storeStrong((id *)&self->_visualIdentifiers, 0);
  objc_storeStrong((id *)&self->_customIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_anniversary, 0);
  objc_storeStrong((id *)&self->_nonGregorianDateOfBirth, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_relatedPeople, 0);
  objc_storeStrong((id *)&self->_softwareLinks, 0);
  objc_storeStrong((id *)&self->_postalAddressLinks, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (GDPerson)initWithTriplesIterator:(id)a3
{
  id v4;
  GDPerson *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  GDEntityIdentifier *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  GDEntityIdentifier *entityIdentifier;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  int isEqual;
  GDLocationLink *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  int v50;
  GDSoftwareLink *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  int v65;
  GDPersonLink *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  int v80;
  GDPersonIdentifier *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  int v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  const char *v95;
  GDVisualIdentifier *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  int v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  NSDateComponents *dateOfBirth;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  int v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  int v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  GDPerson *v172;
  uint64_t v173;
  NSArray *names;
  GDPersonNameComponents *v175;
  const char *v176;
  uint64_t v177;
  GDPersonNameComponents *nameComponents;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  NSArray *phoneNumbers;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  NSArray *emails;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  NSArray *postalAddressLinks;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  NSArray *softwareLinks;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  NSArray *relatedPeople;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  NSArray *contactIdentifiers;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  NSArray *customIdentifiers;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  NSArray *visualIdentifiers;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  NSArray *visualIdentifierObjects;
  id v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  uint64_t v226;
  id obj;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  objc_super v232;
  _BYTE v233[128];
  uint64_t v234;

  v234 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v232.receiver = self;
  v232.super_class = (Class)GDPerson;
  v5 = -[GDPerson init](&v232, sel_init);
  if (!v5)
    goto LABEL_83;
  v219 = (void *)objc_opt_new();
  v218 = (void *)objc_opt_new();
  v217 = (void *)objc_opt_new();
  v224 = (void *)objc_opt_new();
  v223 = (void *)objc_opt_new();
  v222 = (void *)objc_opt_new();
  v221 = (void *)objc_opt_new();
  v220 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v228 = 0u;
  v229 = 0u;
  v230 = 0u;
  v231 = 0u;
  v216 = v4;
  obj = v4;
  v226 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v228, v233, 16);
  if (!v226)
    goto LABEL_80;
  v225 = *(_QWORD *)v229;
  do
  {
    v12 = 0;
    do
    {
      v13 = v7;
      if (*(_QWORD *)v229 != v225)
        objc_enumerationMutation(obj);
      v14 = v8;
      v15 = v6;
      v16 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * v12);
      if (!v5->_entityIdentifier)
      {
        v17 = [GDEntityIdentifier alloc];
        objc_msgSend_subject(v16, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend_initWithString_(v17, v21, (uint64_t)v20);
        entityIdentifier = v5->_entityIdentifier;
        v5->_entityIdentifier = (GDEntityIdentifier *)v22;

      }
      objc_msgSend_predicate(v16, v10, v11, v216);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v24, v25, (uint64_t)CFSTR("PS225")))
      {
        objc_msgSend_relationshipPredicate(v16, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v28, v29, (uint64_t)CFSTR("PS1")) & 1) != 0)
        {
          objc_msgSend_object(v16, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v32, v33, (uint64_t)CFSTR("CS29"));

          if (isEqual)
          {
            v35 = [GDLocationLink alloc];
            objc_msgSend_relationshipIdIterator(obj, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend_initWithRelationshipIdTriplesIterator_(v35, v39, (uint64_t)v38);

            if (v40)
              objc_msgSend_addObject_(v224, v41, (uint64_t)v40);
            goto LABEL_26;
          }
        }
        else
        {

        }
      }
      if (objc_msgSend_isEqual_(v24, v26, (uint64_t)CFSTR("nm_hasSoftware")))
      {
        objc_msgSend_relationshipPredicate(v16, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v44, v45, (uint64_t)CFSTR("PS1")) & 1) != 0)
        {
          objc_msgSend_object(v16, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend_isEqual_(v48, v49, (uint64_t)CFSTR("nm_softwareRelationshipType"));

          if (v50)
          {
            v51 = [GDSoftwareLink alloc];
            objc_msgSend_relationshipIdIterator(obj, v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend_initWithRelationshipIdTriplesIterator_(v51, v55, (uint64_t)v54);

            if (v40)
              objc_msgSend_addObject_(v223, v56, (uint64_t)v40);
            goto LABEL_26;
          }
        }
        else
        {

        }
      }
      if (objc_msgSend_isEqual_(v24, v42, (uint64_t)CFSTR("PS598")))
      {
        objc_msgSend_relationshipPredicate(v16, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v59, v60, (uint64_t)CFSTR("PS1")) & 1) != 0)
        {
          objc_msgSend_object(v16, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend_isEqual_(v63, v64, (uint64_t)CFSTR("CS168"));

          if (v65)
          {
            v66 = [GDPersonLink alloc];
            objc_msgSend_relationshipIdIterator(obj, v67, v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend_initWithRelationshipIdTriplesIterator_(v66, v70, (uint64_t)v69);

            if (v40)
              objc_msgSend_addObject_(v222, v71, (uint64_t)v40);
            goto LABEL_26;
          }
        }
        else
        {

        }
      }
      if (objc_msgSend_isEqual_(v24, v57, (uint64_t)CFSTR("PS72")))
      {
        objc_msgSend_relationshipPredicate(v16, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v74, v75, (uint64_t)CFSTR("PS1")) & 1) != 0)
        {
          objc_msgSend_object(v16, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend_isEqual_(v78, v79, (uint64_t)CFSTR("CS22"));

          if (v80)
          {
            v81 = [GDPersonIdentifier alloc];
            objc_msgSend_relationshipIdIterator(obj, v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend_initWithRelationshipIdTriplesIterator_(v81, v85, (uint64_t)v84);

            if (!v40)
            {
LABEL_26:
              v6 = v15;
LABEL_39:
              v7 = v13;
              goto LABEL_40;
            }
            objc_msgSend_type(v40, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend_isEqual_(v88, v89, (uint64_t)CFSTR("CNContact"));

            v6 = v15;
            if (v90)
            {
              objc_msgSend_identifier(v40, v91, v92);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v221, v94, (uint64_t)v93);
              v7 = v13;
            }
            else
            {
              objc_msgSend_type(v40, v91, v92);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = objc_msgSend_isEqual_(v121, v122, (uint64_t)CFSTR("INPerson"));

              v7 = v13;
              if (!v123)
                goto LABEL_40;
              objc_msgSend_identifier(v40, v124, v125);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v220, v126, (uint64_t)v93);
            }

            goto LABEL_40;
          }
        }
        else
        {

        }
      }
      if (objc_msgSend_isEqual_(v24, v72, (uint64_t)CFSTR("nm_hasVisualIdentifier")))
      {
        v96 = [GDVisualIdentifier alloc];
        objc_msgSend_relationshipIdIterator(obj, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend_initWithRelationshipIdTriplesIterator_(v96, v100, (uint64_t)v99);

        v6 = v15;
        if (!v40)
          goto LABEL_39;
        objc_msgSend_visualIdentifier(v40, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v15, v104, (uint64_t)v103);

        v7 = v13;
        objc_msgSend_addObject_(v13, v105, (uint64_t)v40);
LABEL_40:
        v8 = v14;
LABEL_41:

        goto LABEL_42;
      }
      v6 = v15;
      v8 = v14;
      if (objc_msgSend_isEqual_(v24, v95, (uint64_t)CFSTR("PS545")))
      {
        objc_msgSend_prefixes(v14, v106, v107);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_object(v16, v108, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v40, v111, (uint64_t)v110);

        v7 = v13;
        goto LABEL_41;
      }
      v7 = v13;
      if (objc_msgSend_isEqual_(v24, v106, (uint64_t)CFSTR("PS312")))
      {
        objc_msgSend_givenNames(v14, v112, v113);
        v114 = objc_claimAutoreleasedReturnValue();
LABEL_59:
        v40 = (void *)v114;
        objc_msgSend_object(v16, v115, v116);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v40, v132, (uint64_t)v131);

        goto LABEL_41;
      }
      if (objc_msgSend_isEqual_(v24, v112, (uint64_t)CFSTR("PS546")))
      {
        objc_msgSend_middleNames(v14, v117, v118);
        v114 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v24, v117, (uint64_t)CFSTR("PS441")))
      {
        objc_msgSend_familyNames(v14, v119, v120);
        v114 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v24, v119, (uint64_t)CFSTR("PS547")))
      {
        objc_msgSend_suffixes(v14, v127, v128);
        v114 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v24, v127, (uint64_t)CFSTR("PS89")))
      {
        objc_msgSend_nicknames(v14, v129, v130);
        v114 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v24, v129, (uint64_t)CFSTR("PS33")))
      {
        objc_msgSend_object(v16, v133, v134);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v219, v135, (uint64_t)v40);
        goto LABEL_41;
      }
      if (objc_msgSend_isEqual_(v24, v133, (uint64_t)CFSTR("PS37")))
      {
        objc_msgSend_object(v16, v136, v137);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateComponentsFromJSONString_(v5, v138, (uint64_t)v40);
        v139 = objc_claimAutoreleasedReturnValue();
        dateOfBirth = v5->_dateOfBirth;
        v5->_dateOfBirth = (NSDateComponents *)v139;
LABEL_68:

        goto LABEL_41;
      }
      if (objc_msgSend_isEqual_(v24, v136, (uint64_t)CFSTR("nm_nonGregorianBirthday")))
      {
        objc_msgSend_object(v16, v141, v142);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateComponentsFromJSONString_(v5, v143, (uint64_t)v40);
        v144 = objc_claimAutoreleasedReturnValue();
        dateOfBirth = v5->_nonGregorianDateOfBirth;
        v5->_nonGregorianDateOfBirth = (NSDateComponents *)v144;
        goto LABEL_68;
      }
      if (objc_msgSend_isEqual_(v24, v141, (uint64_t)CFSTR("nm_anniversary")))
      {
        objc_msgSend_object(v16, v145, v146);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateComponentsFromJSONString_(v5, v147, (uint64_t)v40);
        v148 = objc_claimAutoreleasedReturnValue();
        dateOfBirth = v5->_anniversary;
        v5->_anniversary = (NSDateComponents *)v148;
        goto LABEL_68;
      }
      if ((objc_msgSend_isEqual_(v24, v145, (uint64_t)CFSTR("PS407")) & 1) != 0
        || (objc_msgSend_relationshipPredicate(v16, v149, v150),
            v151 = (void *)objc_claimAutoreleasedReturnValue(),
            v153 = objc_msgSend_isEqual_(v151, v152, (uint64_t)CFSTR("PS407")),
            v151,
            v153))
      {
        objc_msgSend_object(v16, v149, v150);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v218, v154, (uint64_t)v40);
        goto LABEL_40;
      }
      if ((objc_msgSend_isEqual_(v24, v149, (uint64_t)CFSTR("PS406")) & 1) != 0
        || (objc_msgSend_relationshipPredicate(v16, v155, v156),
            v157 = (void *)objc_claimAutoreleasedReturnValue(),
            v159 = objc_msgSend_isEqual_(v157, v158, (uint64_t)CFSTR("PS406")),
            v157,
            v159))
      {
        objc_msgSend_object(v16, v155, v156);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v217, v160, (uint64_t)v40);
        goto LABEL_40;
      }
      if (objc_msgSend_isEqual_(v24, v155, (uint64_t)CFSTR("nm_personType")))
      {
        objc_msgSend_object(v16, v161, v162);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_type = objc_msgSend_integerValue(v40, v163, v164);
        goto LABEL_40;
      }
      v8 = v14;
      if (objc_msgSend_isEqual_(v24, v161, (uint64_t)CFSTR("nm_isFavorite")))
      {
        objc_msgSend_object(v16, v165, v166);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_isFavorite = objc_msgSend_integerValue(v40, v167, v168) != 0;
        goto LABEL_41;
      }
LABEL_42:

      ++v12;
    }
    while (v226 != v12);
    v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v228, v233, 16);
    v226 = v169;
  }
  while (v169);
LABEL_80:

  v172 = (GDPerson *)v5->_entityIdentifier;
  if (v172)
  {
    v173 = objc_msgSend_copy(v219, v170, v171);
    names = v5->_names;
    v5->_names = (NSArray *)v173;

    v175 = [GDPersonNameComponents alloc];
    v177 = objc_msgSend_initWithNameComponentsBuilder_(v175, v176, (uint64_t)v8);
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (GDPersonNameComponents *)v177;

    v181 = objc_msgSend_copy(v218, v179, v180);
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v181;

    v185 = objc_msgSend_copy(v217, v183, v184);
    emails = v5->_emails;
    v5->_emails = (NSArray *)v185;

    v189 = objc_msgSend_copy(v224, v187, v188);
    postalAddressLinks = v5->_postalAddressLinks;
    v5->_postalAddressLinks = (NSArray *)v189;

    v193 = objc_msgSend_copy(v223, v191, v192);
    softwareLinks = v5->_softwareLinks;
    v5->_softwareLinks = (NSArray *)v193;

    v197 = objc_msgSend_copy(v222, v195, v196);
    relatedPeople = v5->_relatedPeople;
    v5->_relatedPeople = (NSArray *)v197;

    v201 = objc_msgSend_copy(v221, v199, v200);
    contactIdentifiers = v5->_contactIdentifiers;
    v5->_contactIdentifiers = (NSArray *)v201;

    v205 = objc_msgSend_copy(v220, v203, v204);
    customIdentifiers = v5->_customIdentifiers;
    v5->_customIdentifiers = (NSArray *)v205;

    v209 = objc_msgSend_copy(v6, v207, v208);
    visualIdentifiers = v5->_visualIdentifiers;
    v5->_visualIdentifiers = (NSArray *)v209;

    v213 = objc_msgSend_copy(v7, v211, v212);
    visualIdentifierObjects = v5->_visualIdentifierObjects;
    v5->_visualIdentifierObjects = (NSArray *)v213;

  }
  v4 = v216;
  if (v172)
LABEL_83:
    v172 = v5;

  return v172;
}

- (id)dateComponentsFromJSONString:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  id v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  void *v58;
  NSObject *v59;
  id v60;
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_dataUsingEncoding_(v3, v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1AF45451C]();
    v60 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v7, (uint64_t)v5, 1, &v60);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v60;
    objc_autoreleasePoolPop(v6);
    if (v8)
    {
      objc_msgSend_objectForKeyedSubscript_(v8, v10, (uint64_t)CFSTR("calendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("locale"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("identifier"));
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v17 = objc_alloc(MEMORY[0x1E0C99DC8]);
        v19 = objc_msgSend_initWithLocaleIdentifier_(v17, v18, (uint64_t)v15);
      }
      else
      {
        v19 = 0;
      }
      objc_msgSend_objectForKeyedSubscript_(v8, v16, (uint64_t)CFSTR("calendar"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("timeZone"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)CFSTR("identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v27 = objc_alloc(MEMORY[0x1E0C99E80]);
        v29 = (void *)objc_msgSend_initWithName_(v27, v28, (uint64_t)v25);
      }
      else
      {
        v29 = 0;
      }
      objc_msgSend_objectForKeyedSubscript_(v8, v26, (uint64_t)CFSTR("calendar"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)CFSTR("identifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)v19;
      v59 = v9;
      if (v32)
      {
        v33 = objc_alloc(MEMORY[0x1E0C99D48]);
        v35 = (void *)objc_msgSend_initWithCalendarIdentifier_(v33, v34, (uint64_t)v32);
        v37 = v35;
        if (v29)
          objc_msgSend_setTimeZone_(v35, v36, (uint64_t)v29);
        if (v19)
          objc_msgSend_setLocale_(v37, v36, v19);
      }
      else
      {
        v37 = 0;
      }
      v20 = (void *)objc_opt_new();
      objc_msgSend_setCalendar_(v20, v38, (uint64_t)v37);
      objc_msgSend_objectForKeyedSubscript_(v8, v39, (uint64_t)CFSTR("year"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_integerValue(v40, v41, v42);
      objc_msgSend_setYear_(v20, v44, v43);

      objc_msgSend_objectForKeyedSubscript_(v8, v45, (uint64_t)CFSTR("month"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_integerValue(v46, v47, v48);
      objc_msgSend_setMonth_(v20, v50, v49);

      objc_msgSend_objectForKeyedSubscript_(v8, v51, (uint64_t)CFSTR("day"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend_integerValue(v52, v53, v54);
      objc_msgSend_setDay_(v20, v56, v55);

      v9 = v59;
    }
    else
    {
      GDViewLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v3;
        _os_log_error_impl(&dword_1AE4F2000, v15, OS_LOG_TYPE_ERROR, "GDPerson: failed to decode date components string %@", buf, 0xCu);
      }
      v20 = 0;
    }

  }
  else
  {
    GDViewLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v3;
      _os_log_error_impl(&dword_1AE4F2000, v9, OS_LOG_TYPE_ERROR, "GDPerson: failed to decode date components string %@", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end
