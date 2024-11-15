@implementation CKXAtomORCSchemaFormatVersionORCv2

- (CKXAtomORCSchemaFormatVersionORCv2)initWithBinding:(id)a3
{
  id v5;
  CKXAtomORCSchemaFormatVersionORCv2 *v6;
  CKXAtomORCSchemaFormatVersionORCv2 *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKXAtomORCSchemaFormatVersionORCv2;
  v6 = -[CKXAtomORCSchemaFormatVersionORCv2 init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_binding, a3);

  return v7;
}

- (id)generateSchema
{
  void *v2;
  const char *v3;
  const char *v4;
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

  v2 = (void *)objc_opt_new();
  objc_msgSend_appendString_(v2, v3, (uint64_t)CFSTR("struct<"));
  objc_msgSend_appendString_(v2, v4, (uint64_t)CFSTR("__site_identifier:struct<"));
  objc_msgSend_appendString_(v2, v5, (uint64_t)CFSTR("identifier:binary,"));
  objc_msgSend_appendString_(v2, v6, (uint64_t)CFSTR("modifier:binary,"));
  objc_msgSend_appendString_(v2, v7, (uint64_t)CFSTR(">,"));
  objc_msgSend_appendString_(v2, v8, (uint64_t)CFSTR("__timestamp:struct<"));
  objc_msgSend_appendString_(v2, v9, (uint64_t)CFSTR("__site_identifier_row:bigint,"));
  objc_msgSend_appendString_(v2, v10, (uint64_t)CFSTR("clock:bigint,"));
  objc_msgSend_appendString_(v2, v11, (uint64_t)CFSTR(">,"));
  objc_msgSend_appendString_(v2, v12, (uint64_t)CFSTR("__reference:struct<"));
  objc_msgSend_appendString_(v2, v13, (uint64_t)CFSTR("__timestamp_row:bigint,"));
  objc_msgSend_appendString_(v2, v14, (uint64_t)CFSTR("__location_row:bigint,"));
  objc_msgSend_appendString_(v2, v15, (uint64_t)CFSTR(">,"));
  objc_msgSend_appendString_(v2, v16, (uint64_t)CFSTR("__atom:struct<"));
  objc_msgSend_appendString_(v2, v17, (uint64_t)CFSTR("version:bigint,"));
  objc_msgSend_appendString_(v2, v18, (uint64_t)CFSTR("__timestamp_row:bigint,"));
  objc_msgSend_appendString_(v2, v19, (uint64_t)CFSTR("references:array<__reference_row:bigint>,"));
  objc_msgSend_appendString_(v2, v20, (uint64_t)CFSTR("atom_type:bigint,"));
  objc_msgSend_appendString_(v2, v21, (uint64_t)CFSTR("value:binary,"));
  objc_msgSend_appendString_(v2, v22, (uint64_t)CFSTR(">,"));
  objc_msgSend_appendString_(v2, v23, (uint64_t)CFSTR("__location:struct<"));
  objc_msgSend_appendString_(v2, v24, (uint64_t)CFSTR("identifier:binary,"));
  objc_msgSend_appendString_(v2, v25, (uint64_t)CFSTR(">,"));
  objc_msgSend_appendString_(v2, v26, (uint64_t)CFSTR(">"));
  return v2;
}

- (void)configureColumnsWithRootColumn:(void *)a3
{
  const void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  const void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  const void *v25;
  const char *v26;
  void *v27;

  v5 = *(const void **)(*((_QWORD *)a3 + 10)
                      + 8 * objc_msgSend_topLevelIndexForStruct_(self, a2, self->_binding->tokens.location));
  if (v5)
  {
    v7 = __dynamic_cast(v5, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v8, (uint64_t)v7, 1, 0, &unk_1E984B548);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v6, 0, 1, 0, &unk_1E984B548);
  }
  v10 = *(const void **)(*((_QWORD *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v9, self->_binding->tokens.siteIdentifier));
  if (v10)
  {
    v12 = __dynamic_cast(v10, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v13, (uint64_t)v12, 1, 0, &unk_1E984B568);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v11, 0, 1, 0, &unk_1E984B568);
  }
  v15 = *(const void **)(*((_QWORD *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v14, self->_binding->tokens.timestamp));
  if (v15)
  {
    v17 = __dynamic_cast(v15, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v18, (uint64_t)v17, 1, 0, &unk_1E984B588);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v16, 0, 1, 0, &unk_1E984B588);
  }
  v20 = *(const void **)(*((_QWORD *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v19, self->_binding->tokens.reference));
  if (v20)
  {
    v22 = __dynamic_cast(v20, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v23, (uint64_t)v22, 1, 0, &unk_1E984B5A8);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v21, 0, 1, 0, &unk_1E984B5A8);
  }
  v25 = *(const void **)(*((_QWORD *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v24, self->_binding->tokens.atom));
  if (v25)
    v27 = __dynamic_cast(v25, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
  else
    v27 = 0;
  objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v26, (uint64_t)v27, 1, 0, &unk_1E984B5C8);
}

- (unint64_t)topLevelIndexForStruct:(unint64_t)a3
{
  CKXAtomBindingImplementation *binding;
  void *v8;
  const char *v9;

  binding = self->_binding;
  if (binding->tokens.siteIdentifier == a3)
    return 0;
  if (binding->tokens.timestamp == a3)
    return 1;
  if (binding->tokens.reference == a3)
    return 2;
  if (binding->tokens.atom == a3)
    return 3;
  if (binding->tokens.location == a3)
    return 4;
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKXAtomORCSchema.mm"), 376, CFSTR("Invalid struct %lu"), a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)structReferenceIndexForReference:(unint64_t)a3
{
  CKXAtomBindingImplementation *binding;
  void *v8;
  const char *v9;

  binding = self->_binding;
  if (binding->tokens.timestamp_siteIdentifier == a3)
    return 0;
  if (binding->tokens.atom_timestamp == a3)
    return 1;
  if (binding->tokens.reference_timestamp == a3)
    return 0;
  if (binding->tokens.reference_location == a3)
    return 1;
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKXAtomORCSchema.mm"), 398, CFSTR("Invalid field %lu"), a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)listColumnIndexForReference:(unint64_t)a3
{
  void *v7;
  const char *v8;

  if (self->_binding->tokens.atom_references == a3)
    return 2;
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKXAtomORCSchema.mm"), 412, CFSTR("Invalid field %lu"), a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)valueColumnIndexForField:(unint64_t)a3
{
  CKXAtomBindingImplementation *binding;
  void *v8;
  const char *v9;

  binding = self->_binding;
  if (binding->tokens.siteIdentifier_identifier == a3)
    return 0;
  if (binding->tokens.siteIdentifier_modifier == a3 || binding->tokens.timestamp_clock == a3)
    return 1;
  if (binding->tokens.atom_version == a3)
    return 0;
  if (binding->tokens.atom_atom_type == a3)
    return 3;
  if (binding->tokens.atom_value == a3)
    return 4;
  if (binding->tokens.location_identifier == a3)
    return 0;
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKXAtomORCSchema.mm"), 441, CFSTR("Invalid field %lu"), a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CKXAtomBindingImplementation)binding
{
  return self->_binding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binding, 0);
}

@end
