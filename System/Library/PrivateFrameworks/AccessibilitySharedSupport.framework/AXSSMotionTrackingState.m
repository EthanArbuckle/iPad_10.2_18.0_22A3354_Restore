@implementation AXSSMotionTrackingState

- (AXSSMotionTrackingState)init
{
  AXSSMotionTrackingState *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSSMotionTrackingState;
  v2 = -[AXSSMotionTrackingState init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSMotionTrackingState setExpressions:](v2, "setExpressions:", v3);

    -[AXSSMotionTrackingState setLookAtPoint:](v2, "setLookAtPoint:", 1.79769313e308, 1.79769313e308);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("AXSSMotionTrackingErrorDomain"), 11, 0);
    -[AXSSMotionTrackingState setError:](v2, "setError:", v4);

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXSSMotionTrackingState *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(AXSSMotionTrackingState);
  -[AXSSMotionTrackingState error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingState setError:](v4, "setError:", v5);

  -[AXSSMotionTrackingState expressions](self, "expressions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingState setExpressions:](v4, "setExpressions:", v6);

  -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
  -[AXSSMotionTrackingState setLookAtPoint:](v4, "setLookAtPoint:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  void *v18;
  NSPoint v20;
  NSPoint v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXSSMotionTrackingState error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);
    if ((v7 & 1) != 0)
      goto LABEL_3;
    -[AXSSMotionTrackingState error](self, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v16 = 0;
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
LABEL_3:
      -[AXSSMotionTrackingState expressions](self, "expressions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "expressions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
        v11 = v10;
        v13 = v12;
        objc_msgSend(v4, "lookAtPoint");
        v21.x = v14;
        v21.y = v15;
        v20.x = v11;
        v20.y = v13;
        v16 = NSEqualPoints(v20, v21);
      }
      else
      {
        v16 = 0;
      }

      if ((v7 & 1) != 0)
        goto LABEL_15;
      v18 = 0;
    }
    else
    {
      v16 = 0;
    }

    v17 = 0;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)hasFace
{
  NSPoint v3;
  NSPoint v4;

  -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
  v4.x = 1.79769313e308;
  v4.y = 1.79769313e308;
  return !NSEqualPoints(v3, v4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  NSPoint v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)AXSSMotionTrackingState;
  -[AXSSMotionTrackingState description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
  NSStringFromPoint(v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingState expressions](self, "expressions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingState error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <point: %@ expressions: %@ error: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
  v6 = v5;
  v8 = v7;
  NSStringFromSelector(sel_lookAtPoint);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodePoint:forKey:", v9, v6, v8);

  -[AXSSMotionTrackingState error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_error);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v11);

  -[AXSSMotionTrackingState expressions](self, "expressions");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_expressions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v12);

}

- (AXSSMotionTrackingState)initWithCoder:(id)a3
{
  id v4;
  AXSSMotionTrackingState *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AXSSMotionTrackingState;
  v5 = -[AXSSMotionTrackingState init](&v20, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_lookAtPoint);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodePointForKey:", v6);
    -[AXSSMotionTrackingState setLookAtPoint:](v5, "setLookAtPoint:");

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_error);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSMotionTrackingState setError:](v5, "setError:", v13);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_expressions);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSMotionTrackingState setExpressions:](v5, "setExpressions:", v18);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)debugString
{
  return (NSString *)-[AXSSMotionTrackingState debugStringForTrackingType:](self, "debugStringForTrackingType:", 0);
}

- (id)debugStringForTrackingType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  NSPoint v25;
  NSPoint v26;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
  v26.x = 1.79769313e308;
  v26.y = 1.79769313e308;
  if (NSEqualPoints(v25, v26))
  {
    objc_msgSend(v5, "appendString:", CFSTR("No position\n"));
  }
  else
  {
    -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
    v7 = v6;
    -[AXSSMotionTrackingState lookAtPoint](self, "lookAtPoint");
    objc_msgSend(v5, "appendFormat:", CFSTR("Position: %0.1f %0.1f\n"), v7, v8);
  }
  -[AXSSMotionTrackingState error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AXSSMotionTrackingState error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXSSHumanReadableDescriptionForMotionTrackingErrorCodeAndTrackingType(objc_msgSend(v10, "code"), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Error: %@\n"), v11);

  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("No error\n"));
  }
  -[AXSSMotionTrackingState expressions](self, "expressions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingState expressions](self, "expressions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __54__AXSSMotionTrackingState_debugStringForTrackingType___block_invoke;
  v23[3] = &unk_1E5F99588;
  v16 = v14;
  v24 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);

  if (!objc_msgSend(v16, "count"))
  {

LABEL_11:
    objc_msgSend(v5, "appendString:", CFSTR("No expressions\n"));
    goto LABEL_12;
  }
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Expressions: %@\n"), v17);

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  v21 = (void *)objc_msgSend(v20, "copy");
  return v21;
}

void __54__AXSSMotionTrackingState_debugStringForTrackingType___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  AXSSHumanReadableDescriptionForMotionTrackingFacialExpression(objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (CGPoint)lookAtPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_lookAtPoint.x;
  y = self->_lookAtPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLookAtPoint:(CGPoint)a3
{
  self->_lookAtPoint = a3;
}

- (NSSet)expressions
{
  return self->_expressions;
}

- (void)setExpressions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressions, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
