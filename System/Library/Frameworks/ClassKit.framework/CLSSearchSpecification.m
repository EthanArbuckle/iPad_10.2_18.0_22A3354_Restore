@implementation CLSSearchSpecification

- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4
{
  CLSSearchSpecification *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSSearchSpecification;
  result = -[CLSSearchSpecification init](&v7, sel_init);
  if (result)
  {
    result->_options = a3;
    result->_behaviors = a4;
    result->_compareOptions = 393;
    result->_includeUnsearchablePersons = 0;
    result->_requiredRoleType = 0;
    result->_requiredLocationRoleType = 0;
    result->_requiredClassMemberRole = 0;
  }
  return result;
}

- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4 searchString:(id)a5
{
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  CLSSearchSpecification *v12;
  uint64_t v13;
  NSString *searchString;

  v8 = a5;
  v12 = (CLSSearchSpecification *)objc_msgSend_initWithOptions_behaviors_(self, v9, a3, a4);
  if (v12)
  {
    objc_msgSend_lowercaseString(v8, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    searchString = v12->_searchString;
    v12->_searchString = (NSString *)v13;

  }
  return v12;
}

- (CLSSearchSpecification)initWithOptions:(unint64_t)a3 behaviors:(unint64_t)a4 searchString:(id)a5 requestor:(id)a6
{
  id v11;
  const char *v12;
  uint64_t v13;
  CLSSearchSpecification *v14;

  v11 = a6;
  v13 = objc_msgSend_initWithOptions_behaviors_searchString_(self, v12, a3, a4, a5);
  v14 = (CLSSearchSpecification *)v13;
  if (v13)
    objc_storeStrong((id *)(v13 + 56), a6);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_options(self, v8, v9);
  v13 = objc_msgSend_behaviors(self, v11, v12);
  objc_msgSend_searchString(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_copy(v16, v17, v18);
  v21 = (void *)objc_msgSend_initWithOptions_behaviors_searchString_(v7, v20, v10, v13, v19);

  objc_msgSend_classLocationIDs(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend_copy(v24, v25, v26);
  objc_msgSend_setClassLocationIDs_(v21, v28, (uint64_t)v27);

  objc_msgSend_classSortDescriptors(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend_copy(v31, v32, v33);
  objc_msgSend_setClassSortDescriptors_(v21, v35, (uint64_t)v34);

  v38 = objc_msgSend_includeUnsearchablePersons(self, v36, v37);
  objc_msgSend_setIncludeUnsearchablePersons_(v21, v39, v38);
  objc_msgSend_personSortDescriptors(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_copy(v42, v43, v44);
  objc_msgSend_setPersonSortDescriptors_(v21, v46, (uint64_t)v45);

  objc_msgSend_personLocationIDs(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend_copy(v49, v50, v51);
  objc_msgSend_setPersonLocationIDs_(v21, v53, (uint64_t)v52);

  objc_msgSend_requiredRoleID(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend_copy(v56, v57, v58);
  objc_msgSend_setRequiredRoleID_(v21, v60, (uint64_t)v59);

  v63 = objc_msgSend_requiredRoleType(self, v61, v62);
  objc_msgSend_setRequiredRoleType_(v21, v64, v63);
  objc_msgSend_requiredPrivilege(self, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend_copy(v67, v68, v69);
  objc_msgSend_setRequiredPrivilege_(v21, v71, (uint64_t)v70);

  objc_msgSend_requiredPrivilegeLocationIDs(self, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend_copy(v74, v75, v76);
  objc_msgSend_setRequiredPrivilegeLocationIDs_(v21, v78, (uint64_t)v77);

  objc_msgSend_prohibitedPrivilege(self, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend_copy(v81, v82, v83);
  objc_msgSend_setProhibitedPrivilege_(v21, v85, (uint64_t)v84);

  objc_msgSend_prohibitedPrivilegeLocationIDs(self, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)objc_msgSend_copy(v88, v89, v90);
  objc_msgSend_setProhibitedPrivilegeLocationIDs_(v21, v92, (uint64_t)v91);

  objc_msgSend_locationSortDescriptors(self, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend_copy(v95, v96, v97);
  objc_msgSend_setLocationSortDescriptors_(v21, v99, (uint64_t)v98);

  objc_msgSend_locationPersonIDs(self, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend_copy(v102, v103, v104);
  objc_msgSend_setLocationPersonIDs_(v21, v106, (uint64_t)v105);

  v109 = objc_msgSend_requiredLocationRoleType(self, v107, v108);
  objc_msgSend_setRequiredLocationRoleType_(v21, v110, v109);
  objc_msgSend_requiredLocationPrivilege(self, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)objc_msgSend_copy(v113, v114, v115);
  objc_msgSend_setRequiredLocationPrivilege_(v21, v117, (uint64_t)v116);

  objc_msgSend_requiredLocationPersonIDs(self, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)objc_msgSend_copy(v120, v121, v122);
  objc_msgSend_setRequiredLocationPersonIDs_(v21, v124, (uint64_t)v123);

  objc_msgSend_prohibitedLocationPrivilege(self, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)objc_msgSend_copy(v127, v128, v129);
  objc_msgSend_setProhibitedLocationPrivilege_(v21, v131, (uint64_t)v130);

  objc_msgSend_prohibitedLocationPersonIDs(self, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (void *)objc_msgSend_copy(v134, v135, v136);
  objc_msgSend_setProhibitedLocationPersonIDs_(v21, v138, (uint64_t)v137);

  objc_msgSend_organizationSortDescriptors(self, v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (void *)objc_msgSend_copy(v141, v142, v143);
  objc_msgSend_setOrganizationSortDescriptors_(v21, v145, (uint64_t)v144);

  objc_msgSend_requiredOrganizationEmailDomain(self, v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = (void *)objc_msgSend_copy(v148, v149, v150);
  objc_msgSend_setRequiredOrganizationEmailDomain_(v21, v152, (uint64_t)v151);

  objc_msgSend_adminRequestor(self, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = (void *)objc_msgSend_copy(v155, v156, v157);
  objc_msgSend_setAdminRequestor_(v21, v159, (uint64_t)v158);

  v162 = objc_msgSend_requiredClassMemberRole(self, v160, v161);
  objc_msgSend_setRequiredClassMemberRole_(v21, v163, v162);
  objc_msgSend_requiredClassMemberClassIDs(self, v164, v165);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = (void *)objc_msgSend_copy(v166, v167, v168);
  objc_msgSend_setRequiredClassMemberClassIDs_(v21, v170, (uint64_t)v169);

  objc_msgSend_groupSortDescriptors(self, v171, v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = (void *)objc_msgSend_copy(v173, v174, v175);
  objc_msgSend_setGroupSortDescriptors_(v21, v177, (uint64_t)v176);

  objc_msgSend_groupLocationIDs(self, v178, v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = (void *)objc_msgSend_copy(v180, v181, v182);
  objc_msgSend_setGroupLocationIDs_(v21, v184, (uint64_t)v183);

  objc_msgSend_requiredGroupMemberGroupIDs(self, v185, v186);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = (void *)objc_msgSend_copy(v187, v188, v189);
  objc_msgSend_setRequiredGroupMemberGroupIDs_(v21, v191, (uint64_t)v190);

  v194 = objc_msgSend_includeEmptyGroupsInResults(self, v192, v193);
  objc_msgSend_setIncludeEmptyGroupsInResults_(v21, v195, v194);
  return v21;
}

- (CLSSearchSpecification)initWithCoder:(id)a3
{
  id v4;
  CLSSearchSpecification *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *searchString;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  NSArray *classLocationIDs;
  const char *v21;
  uint64_t v22;
  NSArray *classSortDescriptors;
  const char *v24;
  const char *v25;
  uint64_t v26;
  NSArray *personSortDescriptors;
  const char *v28;
  uint64_t v29;
  NSArray *personLocationIDs;
  const char *v31;
  uint64_t v32;
  NSString *requiredRoleID;
  const char *v34;
  const char *v35;
  uint64_t v36;
  NSString *requiredPrivilege;
  const char *v38;
  uint64_t v39;
  NSArray *requiredPrivilegeLocationIDs;
  const char *v41;
  uint64_t v42;
  NSString *prohibitedPrivilege;
  const char *v44;
  uint64_t v45;
  NSArray *prohibitedPrivilegeLocationIDs;
  const char *v47;
  uint64_t v48;
  NSArray *locationSortDescriptors;
  const char *v50;
  uint64_t v51;
  NSArray *locationPersonIDs;
  const char *v53;
  const char *v54;
  uint64_t v55;
  NSString *requiredLocationPrivilege;
  const char *v57;
  uint64_t v58;
  NSArray *requiredLocationPersonIDs;
  const char *v60;
  uint64_t v61;
  NSString *prohibitedLocationPrivilege;
  const char *v63;
  uint64_t v64;
  NSArray *prohibitedLocationPersonIDs;
  const char *v66;
  uint64_t v67;
  NSArray *organizationSortDescriptors;
  const char *v69;
  uint64_t v70;
  NSString *requiredOrganizationEmailDomain;
  const char *v72;
  uint64_t v73;
  CLSAdminRequestor *adminRequestor;
  const char *v75;
  const char *v76;
  uint64_t v77;
  NSArray *requiredClassMemberClassIDs;
  const char *v79;
  uint64_t v80;
  NSArray *groupSortDescriptors;
  const char *v82;
  uint64_t v83;
  NSArray *groupLocationIDs;
  const char *v85;
  uint64_t v86;
  NSArray *requiredGroupMemberGroupIDs;
  const char *v88;
  objc_super v90;
  _QWORD v91[6];

  v91[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)CLSSearchSpecification;
  v5 = -[CLSSearchSpecification init](&v90, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    v91[2] = objc_opt_class();
    v91[3] = objc_opt_class();
    v91[4] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v91, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("searchString"));
    v13 = objc_claimAutoreleasedReturnValue();
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v13;

    v5->_compareOptions = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("compareOptions"));
    v5->_options = objc_msgSend_decodeIntegerForKey_(v4, v16, (uint64_t)CFSTR("options"));
    v5->_behaviors = objc_msgSend_decodeIntegerForKey_(v4, v17, (uint64_t)CFSTR("behaviors"));
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v10, CFSTR("classLocationIDs"));
    v19 = objc_claimAutoreleasedReturnValue();
    classLocationIDs = v5->_classLocationIDs;
    v5->_classLocationIDs = (NSArray *)v19;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v10, CFSTR("classSortDescriptors"));
    v22 = objc_claimAutoreleasedReturnValue();
    classSortDescriptors = v5->_classSortDescriptors;
    v5->_classSortDescriptors = (NSArray *)v22;

    v5->_includeUnsearchablePersons = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)CFSTR("includeUnsearchablePersons"));
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v10, CFSTR("personSortDescriptors"));
    v26 = objc_claimAutoreleasedReturnValue();
    personSortDescriptors = v5->_personSortDescriptors;
    v5->_personSortDescriptors = (NSArray *)v26;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v10, CFSTR("personLocationIDs"));
    v29 = objc_claimAutoreleasedReturnValue();
    personLocationIDs = v5->_personLocationIDs;
    v5->_personLocationIDs = (NSArray *)v29;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v10, CFSTR("requiredRoleID"));
    v32 = objc_claimAutoreleasedReturnValue();
    requiredRoleID = v5->_requiredRoleID;
    v5->_requiredRoleID = (NSString *)v32;

    v5->_requiredRoleType = objc_msgSend_decodeIntegerForKey_(v4, v34, (uint64_t)CFSTR("requiredRoleType"));
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v10, CFSTR("requiredPrivilege"));
    v36 = objc_claimAutoreleasedReturnValue();
    requiredPrivilege = v5->_requiredPrivilege;
    v5->_requiredPrivilege = (NSString *)v36;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v10, CFSTR("requiredPrivilegeLocationIDs"));
    v39 = objc_claimAutoreleasedReturnValue();
    requiredPrivilegeLocationIDs = v5->_requiredPrivilegeLocationIDs;
    v5->_requiredPrivilegeLocationIDs = (NSArray *)v39;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v41, (uint64_t)v10, CFSTR("prohibitedPrivilege"));
    v42 = objc_claimAutoreleasedReturnValue();
    prohibitedPrivilege = v5->_prohibitedPrivilege;
    v5->_prohibitedPrivilege = (NSString *)v42;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v44, (uint64_t)v10, CFSTR("prohibitedPrivilegeLocationIDs"));
    v45 = objc_claimAutoreleasedReturnValue();
    prohibitedPrivilegeLocationIDs = v5->_prohibitedPrivilegeLocationIDs;
    v5->_prohibitedPrivilegeLocationIDs = (NSArray *)v45;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v47, (uint64_t)v10, CFSTR("locationSortDescriptors"));
    v48 = objc_claimAutoreleasedReturnValue();
    locationSortDescriptors = v5->_locationSortDescriptors;
    v5->_locationSortDescriptors = (NSArray *)v48;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v50, (uint64_t)v10, CFSTR("locationPersonIDs"));
    v51 = objc_claimAutoreleasedReturnValue();
    locationPersonIDs = v5->_locationPersonIDs;
    v5->_locationPersonIDs = (NSArray *)v51;

    v5->_requiredLocationRoleType = objc_msgSend_decodeIntegerForKey_(v4, v53, (uint64_t)CFSTR("requiredLocationRoleType"));
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v10, CFSTR("requiredLocationPrivilege"));
    v55 = objc_claimAutoreleasedReturnValue();
    requiredLocationPrivilege = v5->_requiredLocationPrivilege;
    v5->_requiredLocationPrivilege = (NSString *)v55;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v57, (uint64_t)v10, CFSTR("requiredLocationPersonIDs"));
    v58 = objc_claimAutoreleasedReturnValue();
    requiredLocationPersonIDs = v5->_requiredLocationPersonIDs;
    v5->_requiredLocationPersonIDs = (NSArray *)v58;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v60, (uint64_t)v10, CFSTR("prohibitedLocationPrivilege"));
    v61 = objc_claimAutoreleasedReturnValue();
    prohibitedLocationPrivilege = v5->_prohibitedLocationPrivilege;
    v5->_prohibitedLocationPrivilege = (NSString *)v61;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v63, (uint64_t)v10, CFSTR("prohibitedLocationPersonIDs"));
    v64 = objc_claimAutoreleasedReturnValue();
    prohibitedLocationPersonIDs = v5->_prohibitedLocationPersonIDs;
    v5->_prohibitedLocationPersonIDs = (NSArray *)v64;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v66, (uint64_t)v10, CFSTR("organizationSortDescriptors"));
    v67 = objc_claimAutoreleasedReturnValue();
    organizationSortDescriptors = v5->_organizationSortDescriptors;
    v5->_organizationSortDescriptors = (NSArray *)v67;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v69, (uint64_t)v10, CFSTR("requiredOrganizationEmailDomain"));
    v70 = objc_claimAutoreleasedReturnValue();
    requiredOrganizationEmailDomain = v5->_requiredOrganizationEmailDomain;
    v5->_requiredOrganizationEmailDomain = (NSString *)v70;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v72, (uint64_t)v10, CFSTR("adminRequestor"));
    v73 = objc_claimAutoreleasedReturnValue();
    adminRequestor = v5->_adminRequestor;
    v5->_adminRequestor = (CLSAdminRequestor *)v73;

    v5->_requiredClassMemberRole = objc_msgSend_decodeIntegerForKey_(v4, v75, (uint64_t)CFSTR("requiredClassMemberRole"));
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v10, CFSTR("requiredClassMemberClassIDs"));
    v77 = objc_claimAutoreleasedReturnValue();
    requiredClassMemberClassIDs = v5->_requiredClassMemberClassIDs;
    v5->_requiredClassMemberClassIDs = (NSArray *)v77;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v79, (uint64_t)v10, CFSTR("groupSortDescriptors"));
    v80 = objc_claimAutoreleasedReturnValue();
    groupSortDescriptors = v5->_groupSortDescriptors;
    v5->_groupSortDescriptors = (NSArray *)v80;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v82, (uint64_t)v10, CFSTR("groupLocationIDs"));
    v83 = objc_claimAutoreleasedReturnValue();
    groupLocationIDs = v5->_groupLocationIDs;
    v5->_groupLocationIDs = (NSArray *)v83;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v85, (uint64_t)v10, CFSTR("requiredGroupMemberGroupIDs"));
    v86 = objc_claimAutoreleasedReturnValue();
    requiredGroupMemberGroupIDs = v5->_requiredGroupMemberGroupIDs;
    v5->_requiredGroupMemberGroupIDs = (NSArray *)v86;

    v5->_includeEmptyGroupsInResults = objc_msgSend_decodeBoolForKey_(v4, v88, (uint64_t)CFSTR("includeEmptyGroupsInResults"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *searchString;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  id v36;

  searchString = self->_searchString;
  v36 = a3;
  objc_msgSend_encodeObject_forKey_(v36, v5, (uint64_t)searchString, CFSTR("searchString"));
  objc_msgSend_encodeInteger_forKey_(v36, v6, self->_compareOptions, CFSTR("compareOptions"));
  objc_msgSend_encodeInteger_forKey_(v36, v7, self->_options, CFSTR("options"));
  objc_msgSend_encodeInteger_forKey_(v36, v8, self->_behaviors, CFSTR("behaviors"));
  objc_msgSend_encodeObject_forKey_(v36, v9, (uint64_t)self->_classLocationIDs, CFSTR("classLocationIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v10, (uint64_t)self->_classSortDescriptors, CFSTR("classSortDescriptors"));
  objc_msgSend_encodeBool_forKey_(v36, v11, self->_includeUnsearchablePersons, CFSTR("includeUnsearchablePersons"));
  objc_msgSend_encodeObject_forKey_(v36, v12, (uint64_t)self->_personSortDescriptors, CFSTR("personSortDescriptors"));
  objc_msgSend_encodeObject_forKey_(v36, v13, (uint64_t)self->_personLocationIDs, CFSTR("personLocationIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v14, (uint64_t)self->_requiredRoleID, CFSTR("requiredRoleID"));
  objc_msgSend_encodeInteger_forKey_(v36, v15, self->_requiredRoleType, CFSTR("requiredRoleType"));
  objc_msgSend_encodeObject_forKey_(v36, v16, (uint64_t)self->_requiredPrivilege, CFSTR("requiredPrivilege"));
  objc_msgSend_encodeObject_forKey_(v36, v17, (uint64_t)self->_requiredPrivilegeLocationIDs, CFSTR("requiredPrivilegeLocationIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v18, (uint64_t)self->_prohibitedPrivilege, CFSTR("prohibitedPrivilege"));
  objc_msgSend_encodeObject_forKey_(v36, v19, (uint64_t)self->_prohibitedPrivilegeLocationIDs, CFSTR("prohibitedPrivilegeLocationIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v20, (uint64_t)self->_locationSortDescriptors, CFSTR("locationSortDescriptors"));
  objc_msgSend_encodeObject_forKey_(v36, v21, (uint64_t)self->_locationPersonIDs, CFSTR("locationPersonIDs"));
  objc_msgSend_encodeInteger_forKey_(v36, v22, self->_requiredLocationRoleType, CFSTR("requiredLocationRoleType"));
  objc_msgSend_encodeObject_forKey_(v36, v23, (uint64_t)self->_requiredLocationPrivilege, CFSTR("requiredLocationPrivilege"));
  objc_msgSend_encodeObject_forKey_(v36, v24, (uint64_t)self->_requiredLocationPersonIDs, CFSTR("requiredLocationPersonIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v25, (uint64_t)self->_prohibitedLocationPrivilege, CFSTR("prohibitedLocationPrivilege"));
  objc_msgSend_encodeObject_forKey_(v36, v26, (uint64_t)self->_prohibitedLocationPersonIDs, CFSTR("prohibitedLocationPersonIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v27, (uint64_t)self->_organizationSortDescriptors, CFSTR("organizationSortDescriptors"));
  objc_msgSend_encodeObject_forKey_(v36, v28, (uint64_t)self->_requiredOrganizationEmailDomain, CFSTR("requiredOrganizationEmailDomain"));
  objc_msgSend_encodeObject_forKey_(v36, v29, (uint64_t)self->_adminRequestor, CFSTR("adminRequestor"));
  objc_msgSend_encodeInteger_forKey_(v36, v30, self->_requiredClassMemberRole, CFSTR("requiredClassMemberRole"));
  objc_msgSend_encodeObject_forKey_(v36, v31, (uint64_t)self->_requiredClassMemberClassIDs, CFSTR("requiredClassMemberClassIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v32, (uint64_t)self->_groupSortDescriptors, CFSTR("groupSortDescriptors"));
  objc_msgSend_encodeObject_forKey_(v36, v33, (uint64_t)self->_groupLocationIDs, CFSTR("groupLocationIDs"));
  objc_msgSend_encodeObject_forKey_(v36, v34, (uint64_t)self->_requiredGroupMemberGroupIDs, CFSTR("requiredGroupMemberGroupIDs"));
  objc_msgSend_encodeBool_forKey_(v36, v35, self->_includeEmptyGroupsInResults, CFSTR("includeEmptyGroupsInResults"));

}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  NSString *searchString;
  void *v10;
  const char *v11;
  NSArray *classLocationIDs;
  NSArray *classSortDescriptors;
  NSArray *groupLocationIDs;
  NSArray *groupSortDescriptors;
  void *v16;
  const char *v17;
  int64_t requiredRoleType;
  void *v19;
  const char *v20;
  NSArray *personSortDescriptors;
  NSArray *personLocationIDs;
  NSString *requiredRoleID;
  NSString *requiredPrivilege;
  NSArray *requiredPrivilegeLocationIDs;
  NSString *prohibitedPrivilege;
  NSArray *prohibitedPrivilegeLocationIDs;
  void *v28;
  const char *v29;
  const char *v30;
  NSArray *requiredGroupMemberGroupIDs;
  NSArray *locationSortDescriptors;
  NSArray *locationPersonIDs;
  void *v34;
  const char *v35;
  NSString *requiredLocationPrivilege;
  NSArray *requiredLocationPersonIDs;
  NSString *prohibitedLocationPrivilege;
  NSArray *prohibitedLocationPersonIDs;
  NSArray *organizationSortDescriptors;
  NSString *requiredOrganizationEmailDomain;
  CLSAdminRequestor *adminRequestor;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  NSStringFromSearchOptions(self->_options);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)v4, CFSTR("options"));

  NSStringFromSearchBehaviors(self->_behaviors);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("behaviors"));

  searchString = self->_searchString;
  if (searchString)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)searchString, CFSTR("searchString"));
    NSStringFromNSStringCompareOptions(self->_compareOptions);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("compareOptions"));

  }
  if ((self->_options & 2) != 0)
  {
    classLocationIDs = self->_classLocationIDs;
    if (classLocationIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)classLocationIDs, CFSTR("classLocationIDs"));
    classSortDescriptors = self->_classSortDescriptors;
    if (classSortDescriptors)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)classSortDescriptors, CFSTR("classSortDescriptors"));
  }
  if ((self->_options & 0x10) != 0)
  {
    groupLocationIDs = self->_groupLocationIDs;
    if (groupLocationIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)groupLocationIDs, CFSTR("groupLocationIDs"));
    groupSortDescriptors = self->_groupSortDescriptors;
    if (groupSortDescriptors)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)groupSortDescriptors, CFSTR("groupSortDescriptors"));
  }
  if ((self->_options & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, self->_includeUnsearchablePersons);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, CFSTR("includeUnsearchablePersons"));

    requiredRoleType = self->_requiredRoleType;
    if (requiredRoleType)
    {
      objc_msgSend_stringForRoleType_(CLSRole, v8, requiredRoleType);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, CFSTR("requiredRoleType"));

    }
    personSortDescriptors = self->_personSortDescriptors;
    if (personSortDescriptors)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)personSortDescriptors, CFSTR("personSortDescriptors"));
    personLocationIDs = self->_personLocationIDs;
    if (personLocationIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)personLocationIDs, CFSTR("personLocationIDs"));
    requiredRoleID = self->_requiredRoleID;
    if (requiredRoleID)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredRoleID, CFSTR("requiredRoleID"));
    requiredPrivilege = self->_requiredPrivilege;
    if (requiredPrivilege)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredPrivilege, CFSTR("requiredPrivilege"));
    requiredPrivilegeLocationIDs = self->_requiredPrivilegeLocationIDs;
    if (requiredPrivilegeLocationIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredPrivilegeLocationIDs, CFSTR("requiredPrivilegeLocationIDs"));
    prohibitedPrivilege = self->_prohibitedPrivilege;
    if (prohibitedPrivilege)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedPrivilege, CFSTR("prohibitedPrivilege"));
    prohibitedPrivilegeLocationIDs = self->_prohibitedPrivilegeLocationIDs;
    if (prohibitedPrivilegeLocationIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedPrivilegeLocationIDs, CFSTR("prohibitedPrivilegeLocationIDs"));
    if (self->_requiredClassMemberClassIDs)
    {
      objc_msgSend_stringForRole_(CLSPerson, v8, self->_requiredClassMemberRole);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v28, CFSTR("requiredClassMemberRole"));

      objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)self->_requiredClassMemberClassIDs, CFSTR("requiredClassMemberClassIDs"));
    }
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    if (requiredGroupMemberGroupIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredGroupMemberGroupIDs, CFSTR("requiredGroupMemberGroupIDs"));
  }
  if ((self->_options & 4) != 0)
  {
    locationSortDescriptors = self->_locationSortDescriptors;
    if (locationSortDescriptors)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)locationSortDescriptors, CFSTR("locationSortDescriptors"));
    locationPersonIDs = self->_locationPersonIDs;
    if (locationPersonIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)locationPersonIDs, CFSTR("locationPersonIDs"));
    objc_msgSend_stringForRoleType_(CLSRole, v8, self->_requiredLocationRoleType);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, CFSTR("requiredLocationRoleType"));

    requiredLocationPrivilege = self->_requiredLocationPrivilege;
    if (requiredLocationPrivilege)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredLocationPrivilege, CFSTR("requiredLocationPrivilege"));
    requiredLocationPersonIDs = self->_requiredLocationPersonIDs;
    if (requiredLocationPersonIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredLocationPersonIDs, CFSTR("requiredLocationPersonIDs"));
    prohibitedLocationPrivilege = self->_prohibitedLocationPrivilege;
    if (prohibitedLocationPrivilege)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedLocationPrivilege, CFSTR("prohibitedLocationPrivilege"));
    prohibitedLocationPersonIDs = self->_prohibitedLocationPersonIDs;
    if (prohibitedLocationPersonIDs)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)prohibitedLocationPersonIDs, CFSTR("prohibitedLocationPersonIDs"));
  }
  if ((self->_options & 8) != 0)
  {
    organizationSortDescriptors = self->_organizationSortDescriptors;
    if (organizationSortDescriptors)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)organizationSortDescriptors, CFSTR("organizationSortDescriptors"));
    requiredOrganizationEmailDomain = self->_requiredOrganizationEmailDomain;
    if (requiredOrganizationEmailDomain)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)requiredOrganizationEmailDomain, CFSTR("requiredOrganizationEmailDomain"));
  }
  adminRequestor = self->_adminRequestor;
  if (adminRequestor)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)adminRequestor, CFSTR("adminRequestor"));
  if (self->_includeEmptyGroupsInResults)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)CFSTR("YES"), CFSTR("includeEmptyGroupsInResults"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)CFSTR("NO"), CFSTR("includeEmptyGroupsInResults"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newlineAnchoredPredicateValueForToken:(id)a3
{
  return (id)objc_msgSend_stringByAppendingString_(CFSTR("\n"), a2, (uint64_t)a3);
}

- (NSArray)searchTokens
{
  uint64_t v2;
  NSString *searchString;
  void *v4;

  searchString = self->_searchString;
  if (searchString)
  {
    objc_msgSend__cls_searchableTokens(searchString, a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (id)predicateUsingSubPredicateBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_searchTokens(self, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v24, v28, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend_length(v16, v11, v12))
        {
          v4[2](v4, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend_addObject_(v5, v17, (uint64_t)v18);

        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v24, v28, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v5, v19, v20))
  {
    objc_msgSend_orPredicateWithSubpredicates_(MEMORY[0x1E0CB3528], v21, (uint64_t)v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)predicateForPersons
{
  uint64_t v2;
  const char *v4;
  void *v5;
  _QWORD v7[5];

  if (objc_msgSend_canUsePersonPredicate(self, a2, v2))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1D40C3A30;
    v7[3] = &unk_1E974C1C0;
    v7[4] = self;
    objc_msgSend_predicateUsingSubPredicateBlock_(self, v4, (uint64_t)v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)predicateForPersonsWithPersonIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend_searchString(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D40C3C24;
    v12[3] = &unk_1E974C1E8;
    v12[4] = self;
    v13 = v4;
    objc_msgSend_predicateUsingSubPredicateBlock_(self, v9, (uint64_t)v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_predicateForPersonsWithObjectIDs_(self, v8, (uint64_t)v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)predicateForClasses
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  if (objc_msgSend_canUseClassPredicate(self, a2, v2))
  {
    objc_msgSend_classLocationIDs(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_count(v6, v7, v8);

    if (v9)
    {
      objc_msgSend_classLocationIDs(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_predicateWithLocationIDs_(self, v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_predicate(self, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)predicateForGroups
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  if (objc_msgSend_canUseGroupPredicate(self, a2, v2))
  {
    objc_msgSend_groupLocationIDs(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_count(v6, v7, v8);

    if (v9)
    {
      objc_msgSend_groupLocationIDs(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_predicateWithLocationIDs_(self, v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_predicate(self, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)predicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1D40C3F1C;
  v3[3] = &unk_1E974C1C0;
  v3[4] = self;
  objc_msgSend_predicateUsingSubPredicateBlock_(self, a2, (uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)predicateWithLocationIDs:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40C4058;
  v9[3] = &unk_1E974C1E8;
  v9[4] = self;
  v10 = v4;
  v5 = v4;
  objc_msgSend_predicateUsingSubPredicateBlock_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isValid:(BOOL)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;

  if (a3)
    return 1;
  if ((objc_msgSend_options(self, a2, a3) & 0x13) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_msgSend_options(self, v7, v8);
    NSStringFromSearchOptions(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_assignError_code_format_(v9, v12, (uint64_t)a4, 4, CFSTR("Query with options: '%@' not allowed without a valid user."), v11);

    return 0;
  }
  objc_msgSend_adminRequestor(self, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_cls_assignError_code_description_(MEMORY[0x1E0CB35C8], v14, (uint64_t)a4, 2, CFSTR("No User Mode searches require a valid CLSAdminRequestor."));
    return 0;
  }
  return 1;
}

- (BOOL)requiresDashboardEntitlement
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_includeUnsearchablePersons)
    return 1;
  if ((objc_msgSend_isOrganizationSearch(self, a2, v2) & 1) != 0)
    return 1;
  objc_msgSend_adminRequestor(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  if ((objc_msgSend_isClassMemberSearch(self, v7, v8) & 1) != 0
    || (objc_msgSend_isGroupMemberSearch(self, v10, v11) & 1) != 0)
  {
    return 0;
  }
  if (!self->_searchString || (objc_msgSend_hasPersonConstraints(self, v12, v13) & 1) != 0)
    return 1;
  return MEMORY[0x1E0DE7D20](self, sel_hasLocationConstraints, v14);
}

- (BOOL)canUseClassPredicate
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)canUseGroupPredicate
{
  return ((uint64_t (*)(CLSSearchSpecification *, char *))MEMORY[0x1E0DE7D20])(self, sel_isGroupSearch);
}

- (BOOL)canUsePersonPredicate
{
  uint64_t v2;

  if ((self->_options & 1) != 0)
    return objc_msgSend_hasPersonConstraints(self, a2, v2) ^ 1;
  else
    return 0;
}

- (BOOL)hasPersonConstraints
{
  if ((self->_options & 1) == 0)
    return 0;
  if (self->_personLocationIDs
    || !self->_searchString
    || self->_requiredRoleID
    || self->_requiredRoleType
    || self->_requiredPrivilege)
  {
    return 1;
  }
  return self->_prohibitedPrivilege != 0;
}

- (BOOL)hasLocationConstraints
{
  return (self->_options & 4) != 0
      && (self->_personLocationIDs
       || self->_requiredLocationPrivilege
       || self->_prohibitedLocationPrivilege
       || self->_requiredLocationRoleType);
}

- (BOOL)isPersonSearch
{
  uint64_t v2;

  if ((self->_options & 1) != 0)
    return objc_msgSend_isClassMemberSearch(self, a2, v2) ^ 1;
  else
    return 0;
}

- (BOOL)isClassSearch
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)isLocationSearch
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)isOrganizationSearch
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)isGroupSearch
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (BOOL)isGroupMemberSearch
{
  uint64_t v2;
  NSArray *requiredGroupMemberGroupIDs;

  if ((self->_options & 1) != 0)
  {
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    if (requiredGroupMemberGroupIDs)
      LOBYTE(requiredGroupMemberGroupIDs) = objc_msgSend_count(requiredGroupMemberGroupIDs, a2, v2) != 0;
  }
  else
  {
    LOBYTE(requiredGroupMemberGroupIDs) = 0;
  }
  return (char)requiredGroupMemberGroupIDs;
}

- (BOOL)isClassMemberSearch
{
  uint64_t v2;
  NSArray *requiredClassMemberClassIDs;

  if ((self->_options & 1) != 0)
  {
    requiredClassMemberClassIDs = self->_requiredClassMemberClassIDs;
    if (!requiredClassMemberClassIDs)
      return (char)requiredClassMemberClassIDs;
    if (self->_requiredClassMemberRole)
    {
      LOBYTE(requiredClassMemberClassIDs) = objc_msgSend_count(requiredClassMemberClassIDs, a2, v2) != 0;
      return (char)requiredClassMemberClassIDs;
    }
  }
  LOBYTE(requiredClassMemberClassIDs) = 0;
  return (char)requiredClassMemberClassIDs;
}

- (void)sanitizeSpecForABMMAID
{
  uint64_t v2;
  unint64_t options;
  unint64_t v5;
  NSObject *v6;
  NSArray *requiredClassMemberClassIDs;
  NSArray *v8;
  NSArray *requiredGroupMemberGroupIDs;
  NSArray *v10;
  uint8_t v11[16];

  options = self->_options;
  if ((options & 2) != 0)
  {
    v5 = self->_options;
    options ^= 2uLL;
    self->_options = options;
    if ((v5 & 0x10) == 0)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v6 = CLSLogSearch;
      if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D4054000, v6, OS_LOG_TYPE_DEFAULT, "Search spec for ABM MAID included CLSSearchOptionsIncludeClasses - changing to groups", v11, 2u);
      }
      options = self->_options | 0x10;
      self->_options = options;
    }
  }
  requiredClassMemberClassIDs = self->_requiredClassMemberClassIDs;
  if (requiredClassMemberClassIDs)
  {
    v8 = (NSArray *)objc_msgSend_copy(requiredClassMemberClassIDs, a2, v2);
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    self->_requiredGroupMemberGroupIDs = v8;

    v10 = self->_requiredClassMemberClassIDs;
    self->_requiredClassMemberClassIDs = 0;

    self->_requiredClassMemberRole = 0;
    options = self->_options;
  }
  objc_msgSend_setIncludeEmptyGroupsInResults_(self, a2, (options >> 5) & 1);
}

- (void)sanitizeSpecForEDUMAID
{
  unint64_t options;
  NSObject *v4;
  NSArray *requiredGroupMemberGroupIDs;
  uint8_t v6[16];

  options = self->_options;
  if ((options & 0x10) != 0)
  {
    self->_options = options ^ 0x10;
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v4 = CLSLogSearch;
    if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D4054000, v4, OS_LOG_TYPE_ERROR, "Search spec for EDU MAID included CLSSearchOptionsIncludeGroups - removing", v6, 2u);
    }
  }
  requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
  if (requiredGroupMemberGroupIDs)
  {
    self->_requiredGroupMemberGroupIDs = 0;

  }
  objc_msgSend_setIncludeEmptyGroupsInResults_(self, a2, 1);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)behaviors
{
  return self->_behaviors;
}

- (void)setBehaviors:(unint64_t)a3
{
  self->_behaviors = a3;
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setSearchTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)compareOptions
{
  return self->_compareOptions;
}

- (void)setCompareOptions:(unint64_t)a3
{
  self->_compareOptions = a3;
}

- (CLSAdminRequestor)adminRequestor
{
  return (CLSAdminRequestor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdminRequestor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)classSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClassSortDescriptors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSArray)classLocationIDs
{
  return self->_classLocationIDs;
}

- (void)setClassLocationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)groupSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setGroupSortDescriptors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSArray)groupLocationIDs
{
  return self->_groupLocationIDs;
}

- (void)setGroupLocationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)includeEmptyGroupsInResults
{
  return self->_includeEmptyGroupsInResults;
}

- (void)setIncludeEmptyGroupsInResults:(BOOL)a3
{
  self->_includeEmptyGroupsInResults = a3;
}

- (NSArray)requiredGroupMemberGroupIDs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRequiredGroupMemberGroupIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)includeUnsearchablePersons
{
  return self->_includeUnsearchablePersons;
}

- (void)setIncludeUnsearchablePersons:(BOOL)a3
{
  self->_includeUnsearchablePersons = a3;
}

- (NSArray)personSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPersonSortDescriptors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSArray)personLocationIDs
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPersonLocationIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)requiredRoleID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRequiredRoleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (int64_t)requiredRoleType
{
  return self->_requiredRoleType;
}

- (void)setRequiredRoleType:(int64_t)a3
{
  self->_requiredRoleType = a3;
}

- (NSString)requiredPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRequiredPrivilege:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSArray)requiredPrivilegeLocationIDs
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRequiredPrivilegeLocationIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSString)prohibitedPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setProhibitedPrivilege:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSArray)prohibitedPrivilegeLocationIDs
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProhibitedPrivilegeLocationIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSArray)locationSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLocationSortDescriptors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSArray)locationPersonIDs
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLocationPersonIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (int64_t)requiredLocationRoleType
{
  return self->_requiredLocationRoleType;
}

- (void)setRequiredLocationRoleType:(int64_t)a3
{
  self->_requiredLocationRoleType = a3;
}

- (NSString)requiredLocationPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRequiredLocationPrivilege:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSArray)requiredLocationPersonIDs
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRequiredLocationPersonIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSString)prohibitedLocationPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setProhibitedLocationPrivilege:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSArray)prohibitedLocationPersonIDs
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProhibitedLocationPersonIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSArray)organizationSortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setOrganizationSortDescriptors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSString)requiredOrganizationEmailDomain
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRequiredOrganizationEmailDomain:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSArray)requiredClassMemberClassIDs
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRequiredClassMemberClassIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (unint64_t)requiredClassMemberRole
{
  return self->_requiredClassMemberRole;
}

- (void)setRequiredClassMemberRole:(unint64_t)a3
{
  self->_requiredClassMemberRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredClassMemberClassIDs, 0);
  objc_storeStrong((id *)&self->_requiredOrganizationEmailDomain, 0);
  objc_storeStrong((id *)&self->_organizationSortDescriptors, 0);
  objc_storeStrong((id *)&self->_prohibitedLocationPersonIDs, 0);
  objc_storeStrong((id *)&self->_prohibitedLocationPrivilege, 0);
  objc_storeStrong((id *)&self->_requiredLocationPersonIDs, 0);
  objc_storeStrong((id *)&self->_requiredLocationPrivilege, 0);
  objc_storeStrong((id *)&self->_locationPersonIDs, 0);
  objc_storeStrong((id *)&self->_locationSortDescriptors, 0);
  objc_storeStrong((id *)&self->_prohibitedPrivilegeLocationIDs, 0);
  objc_storeStrong((id *)&self->_prohibitedPrivilege, 0);
  objc_storeStrong((id *)&self->_requiredPrivilegeLocationIDs, 0);
  objc_storeStrong((id *)&self->_requiredPrivilege, 0);
  objc_storeStrong((id *)&self->_requiredRoleID, 0);
  objc_storeStrong((id *)&self->_personLocationIDs, 0);
  objc_storeStrong((id *)&self->_personSortDescriptors, 0);
  objc_storeStrong((id *)&self->_requiredGroupMemberGroupIDs, 0);
  objc_storeStrong((id *)&self->_groupLocationIDs, 0);
  objc_storeStrong((id *)&self->_groupSortDescriptors, 0);
  objc_storeStrong((id *)&self->_classLocationIDs, 0);
  objc_storeStrong((id *)&self->_classSortDescriptors, 0);
  objc_storeStrong((id *)&self->_adminRequestor, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (id)predicateForPersonsWithObjectIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend_includeUnsearchablePersons(self, v5, v6))
    objc_msgSend_predicateForObjectsWithObjectIDs_(CLSDataObserver, v7, (uint64_t)v4);
  else
    objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v7, (uint64_t)CFSTR("%K IN %@ && isSearchable == 1"), CFSTR("objectID"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)requireRoleType:(int64_t)a3 atLocationIDs:(id)a4
{
  const char *v7;
  uint64_t v8;
  char v9;
  NSString *requiredRoleID;
  id v11;

  v11 = a4;
  v9 = objc_msgSend_options(self, v7, v8);
  if (a3 && (v9 & 1) != 0)
  {
    requiredRoleID = self->_requiredRoleID;
    self->_requiredRoleID = 0;
    self->_requiredRoleType = a3;

    objc_storeStrong((id *)&self->_personLocationIDs, a4);
  }

}

- (void)requireRole:(id)a3 atLocationIDs:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSString *v11;
  NSString *requiredRoleID;
  id v13;

  v13 = a3;
  v6 = a4;
  if ((objc_msgSend_options(self, v7, v8) & 1) != 0)
  {
    self->_requiredRoleType = 0;
    if (v13)
    {
      objc_msgSend_objectID(v13, v9, v10);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      requiredRoleID = self->_requiredRoleID;
      self->_requiredRoleID = v11;
    }
    else
    {
      requiredRoleID = self->_requiredRoleID;
      self->_requiredRoleID = 0;
    }

    objc_storeStrong((id *)&self->_personLocationIDs, a4);
  }

}

- (void)requirePrivilege:(id)a3 atLocationIDs:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *requiredPrivilegeLocationIDs;
  id v14;

  v14 = a3;
  v7 = a4;
  if ((objc_msgSend_options(self, v8, v9) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_requiredPrivilege, a3);
    v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    requiredPrivilegeLocationIDs = self->_requiredPrivilegeLocationIDs;
    self->_requiredPrivilegeLocationIDs = v12;

  }
}

- (void)prohibitPrivilege:(id)a3 atLocationIDs:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *prohibitedPrivilegeLocationIDs;
  id v14;

  v14 = a3;
  v7 = a4;
  if ((objc_msgSend_options(self, v8, v9) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_prohibitedPrivilege, a3);
    v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    prohibitedPrivilegeLocationIDs = self->_prohibitedPrivilegeLocationIDs;
    self->_prohibitedPrivilegeLocationIDs = v12;

  }
}

- (void)restrictToClassesAtLocationIDs:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend_options(self, v5, v6) & 2) != 0)
    objc_storeStrong((id *)&self->_classLocationIDs, a3);

}

- (void)restrictToGroupsAtLocationIDs:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend_options(self, v5, v6) & 0x10) != 0)
    objc_storeStrong((id *)&self->_groupLocationIDs, a3);

}

- (void)requireRoleType:(int64_t)a3 onPersonIDs:(id)a4
{
  const char *v7;
  uint64_t v8;
  char v9;
  id v10;

  v10 = a4;
  v9 = objc_msgSend_options(self, v7, v8);
  if (a3 && (v9 & 4) != 0)
  {
    self->_requiredLocationRoleType = a3;
    objc_storeStrong((id *)&self->_locationPersonIDs, a4);
  }

}

- (void)requirePrivilege:(id)a3 onPersonIDs:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *requiredLocationPersonIDs;
  id v14;

  v14 = a3;
  v7 = a4;
  if ((objc_msgSend_options(self, v8, v9) & 4) != 0)
  {
    objc_storeStrong((id *)&self->_requiredLocationPrivilege, a3);
    v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    requiredLocationPersonIDs = self->_requiredLocationPersonIDs;
    self->_requiredLocationPersonIDs = v12;

  }
}

- (void)prohibitPrivilege:(id)a3 onPersonIDs:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *prohibitedLocationPersonIDs;
  id v14;

  v14 = a3;
  v7 = a4;
  if ((objc_msgSend_options(self, v8, v9) & 4) != 0)
  {
    objc_storeStrong((id *)&self->_prohibitedLocationPrivilege, a3);
    v12 = (NSArray *)objc_msgSend_copy(v7, v10, v11);
    prohibitedLocationPersonIDs = self->_prohibitedLocationPersonIDs;
    self->_prohibitedLocationPersonIDs = v12;

  }
}

- (void)restrictToOrganizationsMatchingEmailDomain:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend_options(self, v5, v6) & 8) != 0)
    objc_storeStrong((id *)&self->_requiredOrganizationEmailDomain, a3);

}

- (void)requireClassMemberRole:(unint64_t)a3 forClassIDs:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *requiredClassMemberClassIDs;
  id v12;

  v12 = a4;
  if ((objc_msgSend_options(self, v6, v7) & 1) != 0)
  {
    self->_requiredClassMemberRole = a3;
    v10 = (NSArray *)objc_msgSend_copy(v12, v8, v9);
    requiredClassMemberClassIDs = self->_requiredClassMemberClassIDs;
    self->_requiredClassMemberClassIDs = v10;

  }
}

- (void)requireGroupMemberIDs:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *requiredGroupMemberGroupIDs;
  id v10;

  v10 = a3;
  if ((objc_msgSend_options(self, v4, v5) & 1) != 0)
  {
    v8 = (NSArray *)objc_msgSend_copy(v10, v6, v7);
    requiredGroupMemberGroupIDs = self->_requiredGroupMemberGroupIDs;
    self->_requiredGroupMemberGroupIDs = v8;

  }
}

@end
