@implementation FIProxyNode

- (FIProxyNode)initWithSubject:(id)a3
{
  FINode *v4;
  FIProxyNode *v5;
  FINode *subjectNode;
  objc_super v8;

  v4 = (FINode *)a3;
  v8.receiver = self;
  v8.super_class = (Class)FIProxyNode;
  v5 = -[FICustomNode init](&v8, sel_init);
  subjectNode = v5->_subjectNode;
  v5->_subjectNode = v4;

  return v5;
}

- (id)fileURL
{
  return -[FINode fileURL](self->_subjectNode, "fileURL");
}

- (id)fpItem
{
  return -[FINode fpItem](self->_subjectNode, "fpItem");
}

- (id)fpDomain
{
  return -[FINode fpDomain](self->_subjectNode, "fpDomain");
}

- (id)fiDomain
{
  return -[FINode fiDomain](self->_subjectNode, "fiDomain");
}

- (id)enumeratorError
{
  return -[FINode enumeratorError](self->_subjectNode, "enumeratorError");
}

- (void)inlineProgressCancel
{
  -[FINode inlineProgressCancel](self->_subjectNode, "inlineProgressCancel");
}

- (id)downloadProgress
{
  return -[FINode downloadProgress](self->_subjectNode, "downloadProgress");
}

- (id)copyProgress
{
  return -[FINode copyProgress](self->_subjectNode, "copyProgress");
}

- (BOOL)isPopulated
{
  return -[FINode isPopulated](self->_subjectNode, "isPopulated");
}

- (id)fileParent
{
  return -[FINode fileParent](self->_subjectNode, "fileParent");
}

- (id)parent
{
  return -[FINode parent](self->_subjectNode, "parent");
}

- (id)_uiParent
{
  return -[FINode _uiParent](self->_subjectNode, "_uiParent");
}

- (id)source
{
  return self->_subjectNode;
}

- (id)nodesToObserve
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_subjectNode;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return -[FINode isValid](self->_subjectNode, "isValid");
}

- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4
{
  return -[FINode nodeIs:error:](self->_subjectNode, "nodeIs:error:", a3, a4);
}

- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4
{
  return -[FINode volumeIs:error:](self->_subjectNode, "volumeIs:error:", *(_QWORD *)&a3, a4);
}

- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4
{
  return -[FINode nodePermissions:error:](self->_subjectNode, "nodePermissions:error:", *(_QWORD *)&a3, a4);
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
  -[FINode synchronizeWithOptions:async:](self->_subjectNode, "synchronizeWithOptions:async:", *(_QWORD *)&a3, a4);
}

- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4
{
  -[FINode synchronizeChildren:events:](self->_subjectNode, "synchronizeChildren:events:", *(_QWORD *)&a3, a4);
}

- (void)nodeRestartObservingWithOptions:(unsigned int)a3
{
  -[FINode nodeRestartObservingWithOptions:](self->_subjectNode, "nodeRestartObservingWithOptions:", *(_QWORD *)&a3);
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsNumber:async:options:error:](self->_subjectNode, "propertyAsNumber:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsDate:async:options:error:](self->_subjectNode, "propertyAsDate:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsString:async:options:error:](self->_subjectNode, "propertyAsString:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsArray:async:options:error:](self->_subjectNode, "propertyAsArray:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsNSObject:async:options:error:](self->_subjectNode, "propertyAsNSObject:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsDictionary:async:options:error:](self->_subjectNode, "propertyAsDictionary:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsBool:async:options:error:](self->_subjectNode, "propertyAsBool:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (id)propertyAsBoolean:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsBoolean:async:options:error:](self->_subjectNode, "propertyAsBoolean:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsData:async:options:error:](self->_subjectNode, "propertyAsData:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return -[FINode setProperty:asNumber:async:options:error:](self->_subjectNode, "setProperty:asNumber:async:options:error:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return -[FINode setProperty:asDate:async:options:error:](self->_subjectNode, "setProperty:asDate:async:options:error:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return -[FINode setProperty:asString:async:options:error:](self->_subjectNode, "setProperty:asString:async:options:error:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return -[FINode setProperty:asArray:async:options:error:](self->_subjectNode, "setProperty:asArray:async:options:error:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return -[FINode setProperty:asDictionary:async:options:error:](self->_subjectNode, "setProperty:asDictionary:async:options:error:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return -[FINode setProperty:asBool:async:options:error:](self->_subjectNode, "setProperty:asBool:async:options:error:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return -[FINode setProperty:asData:async:options:error:](self->_subjectNode, "setProperty:asData:async:options:error:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)markAsUsed:(id *)a3
{
  return -[FINode markAsUsed:](self->_subjectNode, "markAsUsed:", a3);
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  return -[FINode iteratorWithOptions:](self->_subjectNode, "iteratorWithOptions:", *(_QWORD *)&a3);
}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), objc_opt_class(), self->_subjectNode);
}

- (FINode)subjectNode
{
  return self->_subjectNode;
}

- (void)setSubjectNode:(id)a3
{
  objc_storeStrong((id *)&self->_subjectNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectNode, 0);
}

@end
