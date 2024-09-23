@implementation CHRemoteInventoryRequest

- (CHRemoteInventoryRequest)initWithTokenizedResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  return (CHRemoteInventoryRequest *)sub_1BE714E78(self, a3, a4, a5, 0, 0);
}

- (CHRemoteInventoryRequest)initWithRemovedStrokeIdentifiers:(id)a3
{
  return (CHRemoteInventoryRequest *)sub_1BE714E78(self, 0, 0, 0, a3, 0);
}

- (id)initResetInventoryRequest
{
  return sub_1BE714E78(self, 0, 0, 0, 0, 1);
}

- (CHRemoteInventoryRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CHTokenizedResult *v9;
  CHTokenizedResult *tokenizedResult;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CHDrawing *v15;
  CHDrawing *drawing;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  NSArray *strokeIdentifiers;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSSet *v34;
  NSSet *removedStrokeIdentifiers;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("tokenizedResult"), v7, v8);
  v9 = (CHTokenizedResult *)objc_claimAutoreleasedReturnValue();
  tokenizedResult = self->_tokenizedResult;
  self->_tokenizedResult = v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("drawing"), v13, v14);
  v15 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  drawing = self->_drawing;
  self->_drawing = v15;

  v17 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("strokeIdentifiers"), v19, v20);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  strokeIdentifiers = self->_strokeIdentifiers;
  self->_strokeIdentifiers = v21;

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend_setWithObjects_(v23, v26, v24, v27, v28, v29, v25, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("removedStrokeIdentifiers"), v32, v33);
  v34 = (NSSet *)objc_claimAutoreleasedReturnValue();
  removedStrokeIdentifiers = self->_removedStrokeIdentifiers;
  self->_removedStrokeIdentifiers = v34;

  LOBYTE(v24) = objc_msgSend_decodeBoolForKey_(v4, v36, (uint64_t)CFSTR("shouldResetInventory"), v37, v38, v39);
  self->_shouldResetInventory = v24;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  CHTokenizedResult *tokenizedResult;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  tokenizedResult = self->_tokenizedResult;
  v20 = a3;
  objc_msgSend_encodeObject_forKey_(v20, v5, (uint64_t)tokenizedResult, (uint64_t)CFSTR("tokenizedResult"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v8, (uint64_t)self->_drawing, (uint64_t)CFSTR("drawing"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v20, v11, (uint64_t)self->_strokeIdentifiers, (uint64_t)CFSTR("strokeIdentifiers"), v12, v13);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)self->_removedStrokeIdentifiers, (uint64_t)CFSTR("removedStrokeIdentifiers"), v15, v16);
  objc_msgSend_encodeBool_forKey_(v20, v17, self->_shouldResetInventory, (uint64_t)CFSTR("shouldResetInventory"), v18, v19);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (CHTokenizedResult)tokenizedResult
{
  return self->_tokenizedResult;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (NSSet)removedStrokeIdentifiers
{
  return self->_removedStrokeIdentifiers;
}

- (BOOL)shouldResetInventory
{
  return self->_shouldResetInventory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_tokenizedResult, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
