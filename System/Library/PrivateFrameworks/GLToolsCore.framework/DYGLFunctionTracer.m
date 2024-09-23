@implementation DYGLFunctionTracer

- (DYGLFunctionTracer)init
{
  DYGLFunctionTracer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYGLFunctionTracer;
  result = -[DYFunctionTracer init](&v3, sel_init);
  if (result)
    *(Class *)((char *)&result->super.super.isa + (int)*MEMORY[0x24BE39148]) = (Class)CFSTR("NULL");
  return result;
}

- (id)_stringWithNumber:(id)a3 argument:(const Argument *)a4
{
  uint64_t v7;
  int v8;
  unsigned int v9;
  char *v10;
  id result;
  int v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  int v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  objc_super v30;

  switch(a4->var2)
  {
    case 0xFu:
      v15 = objc_msgSend(a3, "unsignedLongLongValue");
      if (!v15)
        return -[DYFunctionTracer nilString](self, "nilString");
      return -[DYFunctionTracer rewriteReceiver:](self, "rewriteReceiver:", v15);
    case 0x11u:
      v16 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
      v17 = objc_msgSend(a3, "unsignedIntValue");
      if (v16)
      {
        v18 = CFSTR("True");
        v19 = CFSTR("False");
      }
      else
      {
        v18 = CFSTR("GL_TRUE");
        v19 = CFSTR("GL_FALSE");
      }
      if (v17)
        return (id)v18;
      else
        return (id)v19;
    case 0x12u:
    case 0x1Fu:
      v7 = objc_msgSend(a3, "unsignedIntValue");
      goto LABEL_3;
    case 0x14u:
      v9 = objc_msgSend(a3, "unsignedIntValue");
      v10 = dy_string_from_attachment_mask(v9, *((_BYTE *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]), 0, 0);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, strlen(v10), 1, 1);
    case 0x15u:
      v20 = objc_msgSend(a3, "unsignedIntValue");
      v10 = dy_string_from_attrib_mask(v20, *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]), 0, 0);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, strlen(v10), 1, 1);
    case 0x16u:
      v21 = objc_msgSend(a3, "unsignedIntValue");
      v10 = dy_string_from_client_attrib_mask(v21, *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]), 0, 0);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, strlen(v10), 1, 1);
    case 0x17u:
      v22 = objc_msgSend(a3, "unsignedIntValue");
      v10 = dy_string_from_map_buffer_range_access(v22, *((_BYTE *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]), 0, 0);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, strlen(v10), 1, 1);
    case 0x18u:
      v23 = objc_msgSend(a3, "unsignedIntValue");
      v10 = dy_string_from_pipeline_stages(v23, *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]), 0, 0);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, strlen(v10), 1, 1);
    case 0x19u:
      v24 = objc_msgSend(a3, "unsignedIntValue");
      v10 = dy_string_from_sync_flags(v24, *((_BYTE *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]), 0, 0);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, strlen(v10), 1, 1);
    case 0x1Au:
      if (objc_msgSend(a3, "unsignedLongLongValue") != -1)
        return -[DYFunctionTracer _stringWithIntegerNumber:coreType:](self, "_stringWithIntegerNumber:coreType:", a3, a4->var1);
      v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
      v13 = CFSTR("TimeoutIgnored");
      v14 = CFSTR("GL_TIMEOUT_IGNORED");
      goto LABEL_52;
    case 0x1Bu:
      v7 = objc_msgSend(a3, "unsignedIntValue");
      if ((_DWORD)v7 == 1)
      {
        v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
        v13 = CFSTR("Lines");
        v14 = CFSTR("GL_LINES");
      }
      else
      {
        if ((_DWORD)v7)
          goto LABEL_3;
        v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
        v13 = CFSTR("Points");
        v14 = CFSTR("GL_POINTS");
      }
      goto LABEL_52;
    case 0x1Cu:
      v7 = objc_msgSend(a3, "unsignedIntValue");
      if ((_DWORD)v7 == 1)
      {
        v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
        v13 = CFSTR("One");
        v14 = CFSTR("GL_ONE");
      }
      else
      {
        if ((_DWORD)v7)
        {
LABEL_3:
          v8 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
          goto LABEL_28;
        }
        v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
        v13 = CFSTR("Zero");
        v14 = CFSTR("GL_ZERO");
      }
      goto LABEL_52;
    case 0x1Du:
      v7 = objc_msgSend(a3, "unsignedIntValue");
      v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
      if ((_DWORD)v7)
        goto LABEL_27;
      v13 = CFSTR("None");
      v14 = CFSTR("GL_NONE");
      goto LABEL_52;
    case 0x1Eu:
      v7 = objc_msgSend(a3, "unsignedIntValue");
      v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
      if (!(_DWORD)v7)
      {
        v13 = CFSTR("NoError");
        v14 = CFSTR("GL_NO_ERROR");
        goto LABEL_52;
      }
LABEL_27:
      v8 = v12 != 0;
LABEL_28:
      result = dy_nsstring_from_enum_ex(v7, v8);
      break;
    case 0x20u:
      v25 = objc_msgSend(a3, "unsignedIntValue");
      if (v25 == 33984)
      {
        v12 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]);
        v13 = CFSTR("Texture0");
        v14 = CFSTR("GL_TEXTURE0");
LABEL_52:
        if (v12)
          result = v13;
        else
          result = v14;
      }
      else
      {
        if (*((_BYTE *)&self->super.super.isa + (int)*MEMORY[0x24BE39130]))
          v29 = CFSTR("Texture%d");
        else
          v29 = CFSTR("GL_TEXTURE0+%d");
        result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v29, (v25 - 33984));
      }
      break;
    case 0x21u:
      v26 = objc_msgSend(a3, "unsignedLongLongValue");
      if (!v26)
        return -[DYFunctionTracer nilString](self, "nilString");
      v27 = v26;
      if (!*((_BYTE *)&self->super.super.isa + (int)*MEMORY[0x24BE39138]))
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%016llx"), v27);
      return -[DYGLFunctionTracer variableForGLSyncID:](self, "variableForGLSyncID:", v26);
    case 0x2Fu:
      v28 = objc_msgSend(a3, "unsignedLongLongValue");
      if (!v28)
        return -[DYFunctionTracer nilString](self, "nilString");
      v27 = v28;
      if (*((_BYTE *)&self->super.super.isa + (int)*MEMORY[0x24BE39138]))
        return -[DYGLFunctionTracer variableForPixelFormatID:](self, "variableForPixelFormatID:", v28);
      else
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%016llx"), v27);
    default:
      v30.receiver = self;
      v30.super_class = (Class)DYGLFunctionTracer;
      return -[DYFunctionTracer _stringWithNumber:argument:](&v30, sel__stringWithNumber_argument_, a3, a4);
  }
  return result;
}

- (id)_stringForScalar1DArrayArgument:(const Argument *)a3 usingBlock:(id)a4
{
  objc_super v5;

  if (!a3->var0)
    return -[DYFunctionTracer nilString](self, "nilString");
  if (!a3->var4)
    return CFSTR("{}");
  v5.receiver = self;
  v5.super_class = (Class)DYGLFunctionTracer;
  return -[DYFunctionTracer _stringForScalar1DArrayArgument:usingBlock:](&v5, sel__stringForScalar1DArrayArgument_usingBlock_);
}

- (id)typeStringForArgument:(const Argument *)a3
{
  signed int var2;
  objc_super v5;

  var2 = a3->var2;
  if (var2 > 32)
  {
    if (var2 != 33)
    {
      if (var2 == 45)
        return CFSTR("CGLPixelFormatAttribute");
      goto LABEL_8;
    }
    return CFSTR("GLsync");
  }
  else
  {
    if (var2 != 17)
    {
      if (var2 == 18)
        return CFSTR("GLenum");
LABEL_8:
      v5.receiver = self;
      v5.super_class = (Class)DYGLFunctionTracer;
      return -[DYFunctionTracer typeStringForArgument:](&v5, sel_typeStringForArgument_);
    }
    return CFSTR("GLBOOLean");
  }
}

- (void)_setCurrentReceiver:(const Function *)a3
{
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39140]) = (Class)*((_QWORD *)a3 + 2);
}

- (void)_prependReceiver:(id)a3 function:(const Function *)a4
{
  _QWORD v5[3];

  v5[0] = (char *)a4 + 16;
  v5[1] = 0xF00000008;
  v5[2] = 0x100000008;
  objc_msgSend(a3, "appendString:", -[DYFunctionTracer valueStringForArgument:](self, "valueStringForArgument:", v5));
  objc_msgSend(a3, "appendString:", CFSTR(" "));
}

- (BOOL)_skipFirstArgumentForFunction:(const Function *)a3
{
  objc_super v4;

  if (*(_DWORD *)a3 < 0x418u)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)DYGLFunctionTracer;
  return -[DYFunctionTracer _skipFirstArgumentForFunction:](&v4, sel__skipFirstArgumentForFunction_);
}

- (void)_appendTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:
{
  const Function *v10;
  int v13;
  _BOOL4 v14;
  uint64_t *v15;
  GPUTools::FD::Function *v16;
  void *var0;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;
  void *v22;
  GPUTools::FD::Function *v23;

  v10 = a4;
  v13 = *(_DWORD *)a4;
  if (*(_DWORD *)a4 == 888)
    goto LABEL_4;
  if (v13 != 123)
  {
    if (v13 != 116)
    {
LABEL_5:
      v14 = 0;
      goto LABEL_6;
    }
LABEL_4:
    LODWORD(v23) = GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)((char *)a4 + 24));
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)&self->_programNames, (unsigned int *)&v23, &v23);
    goto LABEL_5;
  }
  LODWORD(v23) = GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)((char *)a4 + 72));
  v15 = std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::find<unsigned int>(&self->_programNames.__table_.__bucket_list_.__ptr_.__value_, (unsigned int *)&v23);
  v14 = v15 != 0;
  if (v15)
  {
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::erase(&self->_programNames.__table_.__bucket_list_.__ptr_.__value_, v15);
    v13 = 834;
  }
  else
  {
    v13 = 123;
  }
LABEL_6:
  switch(v13)
  {
    case -8192:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ initWithAPI:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v19, v20);
      break;
    case -8191:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ initWithAPI:%@ sharegroup:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v20);
      break;
    case -8190:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ presentRenderbuffer:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v19, v20);
      break;
    case -8189:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ renderbufferStorage:%@ fromDrawable:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v20);
      break;
    case -8188:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ initWithAPI:%@ properties:%@ /* sharegroup:%@ */]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), objc_msgSend(a6, "objectAtIndex:", 3));
      break;
    case -8185:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ dealloc]"), objc_msgSend(a6, "objectAtIndex:", 0), v18, v19, v20);
      break;
    case -8184:
      objc_msgSend(a3, "appendFormat:", CFSTR("[EAGLContext setCurrentContext:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), v18, v19, v20);
      break;
    case -8183:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ setTransform:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v19, v20);
      break;
    case -8182:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ setPosition:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v19, v20);
      break;
    case -8181:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ setAnchorPoint:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v19, v20);
      break;
    case -8179:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ presentRenderbuffer:%@ atTime:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v20);
      break;
    case -8178:
      objc_msgSend(a3, "appendFormat:", CFSTR("[%@ presentRenderbuffer:%@ afterMinimumDuration:%@]"), objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v20);
      break;
    default:
      v23 = 0;
      if (v14)
      {
        v16 = (GPUTools::FD::Function *)operator new();
        MEMORY[0x2426219B8](v16, v10);
        v23 = v16;
        *(_DWORD *)v16 = v13;
        v10 = (const Function *)v16;
      }
      else
      {
        v16 = 0;
      }
      var0 = a5.var0->var0;
      v21.receiver = self;
      v21.super_class = (Class)DYGLFunctionTracer;
      v22 = var0;
      -[DYFunctionTracer _appendTraceLine:withFunction:iterArgument:argumentStrings:returnVariable:](&v21, sel__appendTraceLine_withFunction_iterArgument_argumentStrings_returnVariable_, a3, v10, &v22, a6, a7);
      if (v16)
      {
        GPUTools::FD::Function::~Function(v16);
        MEMORY[0x242621A90]();
      }
      break;
  }
}

- (void)_emitErrors:(id)a3 function:(const Function *)a4
{
  if (*((_WORD *)a4 + 241))
    objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    ERROR: %@ (0x%04x)"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", dy_string_from_enum(*((unsigned __int16 *)a4 + 241))), *((unsigned __int16 *)a4 + 241)));
}

- (unsigned)_objectNameFromVariable:(const char *)a3
{
  return GPUTools::FD::Argument::GLObjectNameFromVariable((GPUTools::FD::Argument *)a3, a2);
}

- (id)variableForReceiverID:(unint64_t)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ctx_%llx"), a3);
  else
    return -[DYFunctionTracer nilString](self, "nilString");
}

- (id)variableForReceiverIDNumber:(id)a3
{
  return -[DYGLFunctionTracer variableForReceiverID:](self, "variableForReceiverID:", objc_msgSend(a3, "unsignedLongLongValue"));
}

- (id)variableForGLSyncID:(unint64_t)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sync_%llx"), a3);
  else
    return -[DYFunctionTracer nilString](self, "nilString");
}

- (id)variableForGLSyncIDNumber:(id)a3
{
  return -[DYGLFunctionTracer variableForGLSyncID:](self, "variableForGLSyncID:", objc_msgSend(a3, "unsignedLongLongValue"));
}

- (id)variableForPBufferID:(unint64_t)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pbuffer_%llx"), a3);
  else
    return -[DYFunctionTracer nilString](self, "nilString");
}

- (id)variableForPBufferIDNumber:(id)a3
{
  return -[DYGLFunctionTracer variableForPBufferID:](self, "variableForPBufferID:", objc_msgSend(a3, "unsignedLongLongValue"));
}

- (id)variableForPixelFormatID:(unint64_t)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pf_%llx"), a3);
  else
    return -[DYFunctionTracer nilString](self, "nilString");
}

- (id)variableForPixelFormatIDNumber:(id)a3
{
  return -[DYGLFunctionTracer variableForPixelFormatID:](self, "variableForPixelFormatID:", objc_msgSend(a3, "unsignedLongLongValue"));
}

- (void).cxx_destruct
{
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)&self->_programNames);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end
