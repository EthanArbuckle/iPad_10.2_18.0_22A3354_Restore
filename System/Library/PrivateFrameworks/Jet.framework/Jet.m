void jet_render_mode::jet_render_mode(jet_render_mode *this)
{
  *(_QWORD *)this = off_24D1A3670;
}

BOOL xglCompileShader(GLuint *a1, uint64_t type, GLchar *a3, _QWORD *a4)
{
  GLuint Shader;
  GLchar *v8;
  _QWORD *v9;
  _BOOL8 v10;
  GLint size;
  GLint size_4;
  GLchar *string[3];

  string[2] = *(GLchar **)MEMORY[0x24BDAC8D0];
  if (a3)
  {
    size_4 = 0;
    Shader = glCreateShader(type);
    *a1 = Shader;
    string[0] = "    #extension GL_OES_standard_derivatives : enable\n"
                "    precision highp float;\n"
                "    precision highp int;\n"
                "    precision lowp sampler2D;\n"
                "    precision lowp samplerCube;\n"
                "    #line 0\n";
    string[1] = a3;
    glShaderSource(Shader, 2, (const GLchar *const *)string, 0);
    glCompileShader(*a1);
    size = 0;
    glGetShaderiv(*a1, 0x8B84u, &size);
    if (size >= 1)
    {
      v8 = (GLchar *)malloc_type_malloc(size, 0x17E45BE7uLL);
      glGetShaderInfoLog(*a1, size, &size, v8);
      if (a4)
      {
        v9 = (_QWORD *)operator new();
        std::string::basic_string[abi:ne180100]<0>(v9, v8);
        *a4 = v9;
      }
      free(v8);
    }
    glGetShaderiv(*a1, 0x8B81u, &size_4);
    v10 = size_4 != 0;
    if (!size_4)
      glDeleteShader(*a1);
  }
  else
  {
    jet_log(CFSTR("Shader source is nullptr\n"), type);
    return 0;
  }
  return v10;
}

void sub_2144CB0B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

BOOL xglLinkProgram(GLuint a1)
{
  GLint params;

  params = 0;
  glLinkProgram(a1);
  glGetProgramiv(a1, 0x8B82u, &params);
  return params != 0;
}

BOOL xglValidateProgram(GLuint a1)
{
  GLchar *v2;
  GLint params[2];

  *(_QWORD *)params = 0;
  glValidateProgram(a1);
  glGetProgramiv(a1, 0x8B84u, &params[1]);
  if (params[1] >= 1)
  {
    v2 = (GLchar *)malloc_type_malloc(params[1], 0x7EE5FD8BuLL);
    glGetProgramInfoLog(a1, params[1], &params[1], v2);
    jet_log(CFSTR("Program validate log:\n%s\n"), v2);
    free(v2);
  }
  glGetProgramiv(a1, 0x8B83u, params);
  return params[0] != 0;
}

void xglPrintFramebufferStatus(void)
{
  uint64_t v0;

  v0 = glCheckFramebufferStatus(0x8D40u);
  switch((int)v0)
  {
    case 36053:
      jet_log(CFSTR("GL_FRAMEBUFFER_COMPLETE\n"));
      return;
    case 36054:
      jet_log(CFSTR("GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT\n"));
      goto LABEL_8;
    case 36055:
      jet_log(CFSTR("GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT\n"));
      goto LABEL_8;
    case 36057:
      jet_log(CFSTR("GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS\n"));
      goto LABEL_8;
    case 36061:
      jet_log(CFSTR("GL_FRAMEBUFFER_UNSUPPORTED\n"));
      goto LABEL_8;
    default:
      jet_log(CFSTR("GL_FRAMEBUFFER_STATUS_UNKNOWN: 0x%X\n"), v0);
LABEL_8:
      xglPrintFramebuffer();
      return;
  }
}

void xglPrintFramebuffer(void)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  GLint v7;
  GLint v8;
  GLint v9;
  GLint v10[2];
  GLint params;

  params = 0;
  glGetIntegerv(0x8CA6u, &params);
  jet_log(CFSTR("GL_FRAMEBUFFER_BINDING: %d\n"), params);
  if (params)
  {
    jet_log(CFSTR("{\n"));
    *(_QWORD *)v10 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD1u, &v10[1]);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD0u, v10);
    if (v10[0] == 5890)
    {
      jet_log(CFSTR("\t GL_COLOR_ATTACHMENT0: GL_TEXTURE : %d\n"), v10[1]);
    }
    else if (v10[0] == 36161)
    {
      v9 = 0;
      glGetIntegerv(0x8CA7u, &v9);
      glBindRenderbuffer(0x8D41u, v10[1]);
      v8 = 0;
      v7 = 0;
      glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v8);
      glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v7);
      glBindRenderbuffer(0x8D41u, v9);
      jet_log(CFSTR("\t GL_COLOR_ATTACHMENT0: GL_RENDERBUFFER : %d {%d x %d}\n"), v10[1], v8, v7);
    }
    else
    {
      jet_log(CFSTR("\t GL_COLOR_ATTACHMENT0: <NONE>\n"), v0);
    }
    *(_QWORD *)v10 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD1u, &v10[1]);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD0u, v10);
    if (v10[0] == 5890)
    {
      jet_log(CFSTR("\t GL_DEPTH_ATTACHMENT: GL_TEXTURE : %d\n"), v10[1], v3, v5);
    }
    else if (v10[0] == 36161)
    {
      v9 = 0;
      glGetIntegerv(0x8CA7u, &v9);
      glBindRenderbuffer(0x8D41u, v10[1]);
      v8 = 0;
      v7 = 0;
      glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v8);
      glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v7);
      glBindRenderbuffer(0x8D41u, v9);
      jet_log(CFSTR("\t GL_DEPTH_ATTACHMENT: GL_RENDERBUFFER : %d {%d x %d}\n"), v10[1], v8, v7);
    }
    else
    {
      jet_log(CFSTR("\t GL_DEPTH_ATTACHMENT: <NONE>\n"), v1, v3, v5);
    }
    *(_QWORD *)v10 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD1u, &v10[1]);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD0u, v10);
    if (v10[0] == 5890)
    {
      jet_log(CFSTR("\t GL_STENCIL_ATTACHMENT: GL_TEXTURE : %d\n"), v10[1], v4, v6);
    }
    else if (v10[0] == 36161)
    {
      v9 = 0;
      glGetIntegerv(0x8CA7u, &v9);
      glBindRenderbuffer(0x8D41u, v10[1]);
      v8 = 0;
      v7 = 0;
      glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v8);
      glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v7);
      glBindRenderbuffer(0x8D41u, v9);
      jet_log(CFSTR("\t GL_STENCIL_ATTACHMENT: GL_RENDERBUFFER : %d {%d x %d}\n"), v10[1], v8, v7);
    }
    else
    {
      jet_log(CFSTR("\t GL_STENCIL_ATTACHMENT: <NONE>\n"), v2, v4, v6);
    }
    jet_log(CFSTR("};\n"));
  }
}

void xglPrintInteger(const char *a1, GLenum pname)
{
  GLint params;

  params = 0;
  glGetIntegerv(pname, &params);
  jet_log(CFSTR("%s%d\n"), a1, params);
}

void xglPrintFloat(const char *a1, GLenum pname)
{
  GLfloat params;

  params = 0.0;
  glGetFloatv(pname, &params);
  jet_log(CFSTR("%s%f\n"), a1, params);
}

void xglPrintBoolean(const char *a1, GLenum pname)
{
  GLBOOLean params;

  params = 0;
  glGetBooleanv(pname, &params);
  jet_log(CFSTR("%s%d\n"), a1, params);
}

void xglPrintVertexAttribInteger(const char *a1, GLuint index, GLenum pname)
{
  const char *v5;
  GLint params[4];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  glGetVertexAttribiv(index, pname, params);
  if (pname != 34342)
  {
    if (pname == 34341)
    {
      if ((params[0] - 5120) > 0xC)
        v5 = "GL_TYPE_UNKNOWN";
      else
        v5 = off_24D1A36D0[params[0] - 5120];
      jet_log(CFSTR("%s%s\n"), a1, v5);
    }
    else
    {
      jet_log(CFSTR("%s%d\n"), a1, params[0]);
    }
  }
}

void xglPrintVertexAttrib(uint64_t a1)
{
  GLuint v1;
  GLint params[4];
  uint64_t v3;

  v1 = a1;
  v3 = *MEMORY[0x24BDAC8D0];
  jet_log(CFSTR("xglPrintVertexAttrib: (%d) {\n"), a1);
  glGetVertexAttribiv(v1, 0x889Fu, params);
  jet_log(CFSTR("%s%d\n"), "\t GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING: ", params[0]);
  glGetVertexAttribiv(v1, 0x8622u, params);
  jet_log(CFSTR("%s%d\n"), "\t GL_VERTEX_ATTRIB_ARRAY_ENABLED: ", params[0]);
  glGetVertexAttribiv(v1, 0x8623u, params);
  jet_log(CFSTR("%s%d\n"), "\t GL_VERTEX_ATTRIB_ARRAY_SIZE: ", params[0]);
  glGetVertexAttribiv(v1, 0x8624u, params);
  jet_log(CFSTR("%s%d\n"), "\t GL_VERTEX_ATTRIB_ARRAY_STRIDE: ", params[0]);
  xglPrintVertexAttribInteger("\t GL_VERTEX_ATTRIB_ARRAY_TYPE: ", v1, 0x8625u);
  glGetVertexAttribiv(v1, 0x886Au, params);
  jet_log(CFSTR("%s%d\n"), "\t GL_VERTEX_ATTRIB_ARRAY_NORMALIZED: ", params[0]);
  jet_log(CFSTR("};\n"));
}

void xglPrintState(void)
{
  GLint params;
  GLint v1;
  GLint v2;

  jet_log(CFSTR("xglPrintState: {\n"));
  params = 0;
  glGetIntegerv(0x8B8Du, &params);
  jet_log(CFSTR("%s%d\n"), "\t GL_CURRENT_PROGRAM: ", params);
  v1 = 0;
  glGetIntegerv(0x8894u, &v1);
  jet_log(CFSTR("%s%d\n"), "\t GL_ARRAY_BUFFER_BINDING: ", v1);
  v2 = 0;
  glGetIntegerv(0x8895u, &v2);
  jet_log(CFSTR("%s%d\n"), "\t GL_ELEMENT_ARRAY_BUFFER_BINDING: ", v2);
  jet_log(CFSTR("};\n"));
}

void xglPrintError(void)
{
  uint64_t Error;

  Error = glGetError();
  switch((int)Error)
  {
    case 1280:
      jet_log(CFSTR("GL_INVALID_ENUM\n"));
      break;
    case 1281:
      jet_log(CFSTR("GL_INVALID_VALUE\n"));
      break;
    case 1282:
    case 1285:
    case 1286:
      jet_log(CFSTR("GL_INVALID_OPERATION\n"));
      break;
    case 1283:
    case 1284:
      goto LABEL_5;
    default:
      if ((_DWORD)Error)
LABEL_5:
        jet_log(CFSTR("GL_ERROR_UNKNOWN: 0x%X\n"), Error);
      else
        jet_log(CFSTR("GL_NO_ERROR\n"));
      break;
  }
}

void xglCheckError(void)
{
  uint64_t Error;

  Error = glGetError();
  switch((int)Error)
  {
    case 1280:
      jet_log(CFSTR("GL_INVALID_ENUM\n"));
      break;
    case 1281:
      jet_log(CFSTR("GL_INVALID_VALUE\n"));
      break;
    case 1282:
    case 1285:
    case 1286:
      jet_log(CFSTR("GL_INVALID_OPERATION\n"));
      break;
    case 1283:
    case 1284:
      goto LABEL_4;
    default:
      if ((_DWORD)Error)
LABEL_4:
        jet_log(CFSTR("GL_ERROR_UNKNOWN: 0x%X\n"), Error);
      break;
  }
}

uint64_t xglAssertNoError(void)
{
  uint64_t result;

  result = glGetError();
  if ((_DWORD)result)
  {
    switch((int)result)
    {
      case 1280:
        jet_log(CFSTR("GL_INVALID_ENUM\n"));
        break;
      case 1281:
        jet_log(CFSTR("GL_INVALID_VALUE\n"));
        break;
      case 1282:
        jet_log(CFSTR("GL_INVALID_OPERATION\n"));
        break;
      case 1285:
        jet_log(CFSTR("GL_OUT_OF_MEMORY\n"));
        break;
      case 1286:
        xglAssertNoError();
        xglAssertNoError();
      default:
        jet_log(CFSTR("GL_ERROR_UNKNOWN: 0x:%X\n"), result);
        break;
    }
    xglAssertNoError();
  }
  return result;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D1A3148, MEMORY[0x24BEDAAF0]);
}

void sub_2144CBBA0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void jet_context::jet_context(jet_context *this)
{
  *(_QWORD *)this = &unk_24D1A3748;
  *((_QWORD *)this + 1) = 0;
  *(_OWORD *)((char *)this + 24) = xmmword_2144DDBA0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 1065353216;
  *((_QWORD *)this + 12) = 0;
}

void jet_context::~jet_context(jet_context *this)
{
  char *v2;
  _QWORD *i;
  _QWORD *v4;
  char *v5;

  *(_QWORD *)this = &unk_24D1A3748;
  v2 = (char *)this + 56;
  for (i = (_QWORD *)*((_QWORD *)this + 9); i; i = (_QWORD *)*i)
  {
    v4 = (_QWORD *)(i[2] + 56);
    v5 = v2;
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>(v4, &v5);
  }

  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::~__hash_table((uint64_t)v2);
  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

jet_command_buffer *jet_context::create_command_buffer(jet_context *this)
{
  jet_command_buffer *v1;

  v1 = (jet_command_buffer *)operator new();
  jet_command_buffer::jet_command_buffer(v1, 0x64uLL);
  return v1;
}

void sub_2144CBCE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0xA1C4030951706);
  _Unwind_Resume(a1);
}

double jet_context::end_render_pass(jet_context *this)
{
  double result;

  std::shared_ptr<jet_fence>::reset[abi:ne180100]((_QWORD *)this + 5);
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)&result = 3;
  *((_QWORD *)this + 3) = 3;
  *((_DWORD *)this + 8) = 0;
  return result;
}

void std::shared_ptr<jet_fence>::reset[abi:ne180100](_QWORD *a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void jet_context::submit_commands(jet_context *a1, void *a2)
{
  void (**v3)(id, void (***)(jet_command_buffer *__hidden));
  void (**v4)(jet_command_buffer *__hidden);
  uint64_t v5;
  void **v6;

  v3 = a2;
  if (v3)
  {
    jet_command_buffer::jet_command_buffer((jet_command_buffer *)&v4, 0x64uLL);
    v3[2](v3, &v4);
    jet_context::execute_command_buffer(a1, (jet_command_buffer *)&v4);
    v4 = off_24D1A38D0;
    v6 = (void **)&v5;
    std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](&v6);
  }

}

void sub_2144CBE28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void jet_context::execute_command_buffer(jet_context *this, jet_command_buffer *a2)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t *p_shared_owners;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unint64_t *v40;
  _OWORD *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD *v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[24];
  _BYTE *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *((_QWORD *)a2 + 2) - *((_QWORD *)a2 + 1);
    if (v3)
    {
      v5 = 0;
      v6 = v3 / 192;
      if (v6 <= 1)
        v7 = 1;
      else
        v7 = v6;
      while (1)
      {
        v8 = *((_QWORD *)a2 + 1);
        v9 = v8 + 192 * v5;
        switch(*(_DWORD *)(v9 + 8))
        {
          case 1:
            (*(void (**)(jet_context *, _QWORD))(*(_QWORD *)this + 200))(this, *(_QWORD *)(v8 + 192 * v5 + 112));
            goto LABEL_76;
          case 2:
            (*(void (**)(jet_context *, _QWORD))(*(_QWORD *)this + 192))(this, *(_QWORD *)(v8 + 192 * v5 + 112));
            goto LABEL_76;
          case 3:
            (*(void (**)(jet_context *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)this + 232))(this, *(unsigned int *)(v8 + 192 * v5 + 128), *(unsigned int *)(v9 + 132), *(unsigned int *)(v9 + 136));
            goto LABEL_76;
          case 4:
            (*(void (**)(jet_context *, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)this + 240))(this, *(unsigned int *)(v8 + 192 * v5 + 128), *(_QWORD *)(v8 + 192 * v5 + 112), *(unsigned int *)(v9 + 132), *(unsigned int *)(v9 + 136));
            goto LABEL_76;
          case 5:
            v17 = v8 + 192 * v5;
            v18 = *(_QWORD *)(v17 + 112);
            v19 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), v17 + 16);
            if ((v19 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t))(*(_QWORD *)this + 256))(this, v18, v19);
            goto LABEL_76;
          case 6:
            jet_context::set_vertex_texture((_QWORD **)this, v8 + 192 * v5 + 16, *(_QWORD *)(v8 + 192 * v5 + 112));
            goto LABEL_76;
          case 7:
            v30 = v8 + 192 * v5;
            v31 = *(_QWORD *)(v30 + 112);
            v32 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v30 + 16);
            if ((v32 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t))(*(_QWORD *)this + 264))(this, v31, v32);
            goto LABEL_76;
          case 8:
            jet_context::set_fragment_texture((_QWORD **)this, v8 + 192 * v5 + 16, *(_QWORD *)(v8 + 192 * v5 + 112));
            goto LABEL_76;
          case 9:
            v33 = v8 + 192 * v5;
            v34 = *(_QWORD *)(v33 + 112);
            v35 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1), v33 + 16);
            if ((v35 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t))(*(_QWORD *)this + 296))(this, v34, v35);
            goto LABEL_76;
          case 0xA:
            (*(void (**)(jet_context *, _QWORD))(*(_QWORD *)this + 216))(this, *(unsigned int *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0xB:
            (*(void (**)(jet_context *, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)this + 208))(this, *(unsigned int *)(v8 + 192 * v5 + 128), *(unsigned int *)(v9 + 132), *(unsigned int *)(v9 + 136), *(unsigned int *)(v9 + 140));
            goto LABEL_76;
          case 0xC:
            (*(void (**)(jet_context *, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)this + 224))(this, *(unsigned int *)(v8 + 192 * v5 + 128), *(unsigned int *)(v9 + 132), *(unsigned int *)(v9 + 136), *(unsigned int *)(v9 + 140));
            goto LABEL_76;
          case 0xD:
            *(_QWORD *)&v65 = this;
            v20 = *(_QWORD *)(v8 + 192 * v5 + 64);
            if (!v20)
              std::__throw_bad_function_call[abi:ne180100]();
            (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v20 + 48))(v20, &v65);
            goto LABEL_76;
          case 0xE:
            (**(void (***)(uint64_t *__return_ptr, jet_context *, _QWORD))this)(&v63, this, *(_QWORD *)(v8 + 192 * v5 + 112));
            v21 = v64;
            if (v64)
            {
              p_shared_owners = (unint64_t *)&v64->__shared_owners_;
              do
                v23 = __ldaxr(p_shared_owners);
              while (__stlxr(v23 - 1, p_shared_owners));
              goto LABEL_56;
            }
            goto LABEL_76;
          case 0xF:
            jet_context::set_vertex_constant_value((_QWORD **)this, *(float *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x10:
            jet_context::set_vertex_constant_value((_QWORD **)this, *(double *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x11:
            v15 = v8 + 192 * v5;
            v65 = *(_OWORD *)(v15 + 128);
            v16 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v15 + 16);
            if ((v16 & 0x80000000) == 0)
              (*(void (**)(jet_context *, _QWORD, uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)this + 272))(this, 0, 3, 1, &v65, v16);
            goto LABEL_76;
          case 0x12:
            jet_context::set_vertex_constant_value((_QWORD **)this, *(__n128 *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x13:
            jet_context::set_vertex_constant_value((_QWORD **)this, *(double *)(v8 + 192 * v5 + 128), *(double *)(v9 + 136));
            goto LABEL_76;
          case 0x14:
            v41 = (_OWORD *)(v8 + 192 * v5);
            v42 = v41[9];
            v43 = v41[10];
            v65 = v41[8];
            v66 = v42;
            v67 = v43;
            v44 = (*(uint64_t (**)(_QWORD, _OWORD *))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v41 + 1);
            if ((v44 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)this + 272))(this, 7, 1, 1, &v65, v44);
            goto LABEL_76;
          case 0x15:
            v24 = (_OWORD *)(v8 + 192 * v5);
            v25 = v24[9];
            v26 = v24[10];
            v27 = v24[11];
            v65 = v24[8];
            v66 = v25;
            v67 = v26;
            v68 = v27;
            v28 = (*(uint64_t (**)(_QWORD, _OWORD *))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v24 + 1);
            if ((v28 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)this + 272))(this, 8, 1, 1, &v65, v28);
            goto LABEL_76;
          case 0x16:
            jet_context::set_fragment_constant_value((_QWORD **)this, *(float *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x17:
            jet_context::set_fragment_constant_value((_QWORD **)this, *(double *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x18:
            v47 = v8 + 192 * v5;
            v65 = *(_OWORD *)(v47 + 128);
            v48 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1), v47 + 16);
            if ((v48 & 0x80000000) == 0)
              (*(void (**)(jet_context *, _QWORD, uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)this + 304))(this, 0, 3, 1, &v65, v48);
            goto LABEL_76;
          case 0x19:
            jet_context::set_fragment_constant_value((_QWORD **)this, *(__n128 *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x1A:
            jet_context::set_fragment_constant_value((_QWORD **)this, *(double *)(v8 + 192 * v5 + 128), *(double *)(v9 + 136));
            goto LABEL_76;
          case 0x1B:
            v55 = (_OWORD *)(v8 + 192 * v5);
            v56 = v55[9];
            v57 = v55[10];
            v65 = v55[8];
            v66 = v56;
            v67 = v57;
            v58 = (*(uint64_t (**)(_QWORD, _OWORD *))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1), v55 + 1);
            if ((v58 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)this + 304))(this, 7, 1, 1, &v65, v58);
            goto LABEL_76;
          case 0x1C:
            v10 = (_OWORD *)(v8 + 192 * v5);
            v11 = v10[9];
            v12 = v10[10];
            v13 = v10[11];
            v65 = v10[8];
            v66 = v11;
            v67 = v12;
            v68 = v13;
            v14 = (*(uint64_t (**)(_QWORD, _OWORD *))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1), v10 + 1);
            if ((v14 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)this + 304))(this, 8, 1, 1, &v65, v14);
            goto LABEL_76;
          case 0x1D:
            v49 = v8 + 192 * v5;
            v50 = *(_QWORD *)(v49 + 112);
            v51 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 40))(*((_QWORD *)this + 1), v49 + 16);
            if ((v51 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t))(*(_QWORD *)this + 288))(this, v50, v51);
            goto LABEL_76;
          case 0x1E:
            v52 = v8 + 192 * v5;
            v53 = *(_QWORD *)(v52 + 112);
            v54 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 64))(*((_QWORD *)this + 1), v52 + 16);
            if ((v54 & 0x80000000) == 0)
              (*(void (**)(jet_context *, uint64_t, uint64_t))(*(_QWORD *)this + 320))(this, v53, v54);
            goto LABEL_76;
          case 0x1F:
            v36 = v8 + 192 * v5;
            v37 = *(_QWORD *)(v36 + 112);
            v38 = *(unsigned int *)(v36 + 128);
            LODWORD(v36) = *(_DWORD *)(v36 + 144);
            v39 = *(_DWORD *)(v9 + 148);
            jet_context::change_render_mode((uint64_t)this, v39 & 1, v37, (v39 >> 1) & 1, v38, (v39 & 4) != 0, *(unsigned int *)(v9 + 132), (v39 & 8) != 0, *(_DWORD *)(v9 + 136), (v39 & 0x10) != 0, *(_DWORD *)(v9 + 140), (v39 & 0x20) != 0, v36 & 1, (v36 & 2) != 0, (v36 & 4) != 0, (v36 & 8) != 0);
            goto LABEL_76;
          case 0x20:
            (*(void (**)(jet_context *, _QWORD))(*(_QWORD *)this + 184))(this, *(_QWORD *)(v8 + 192 * v5 + 112));
            goto LABEL_76;
          case 0x21:
            (*(void (**)(uint64_t *__return_ptr, jet_context *, _QWORD, double))(*(_QWORD *)this + 168))(&v61, this, *(_QWORD *)(v8 + 192 * v5 + 112), *(double *)(v8 + 192 * v5 + 128));
            v21 = v62;
            if (v62)
            {
              v40 = (unint64_t *)&v62->__shared_owners_;
              do
                v23 = __ldaxr(v40);
              while (__stlxr(v23 - 1, v40));
              goto LABEL_56;
            }
            goto LABEL_76;
          case 0x22:
            jet_context::set_vertex_constant_value((_QWORD **)this, v8 + 192 * v5 + 16, *(_DWORD *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x23:
            jet_context::set_vertex_constant_value((_QWORD **)this, *(double *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x24:
            jet_context::set_vertex_constant_value((_QWORD **)this, *(__n128 *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x25:
            jet_context::set_vertex_constant_value((_QWORD **)this, *(__n128 *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x26:
            jet_context::set_fragment_constant_value((_QWORD **)this, v8 + 192 * v5 + 16, *(_DWORD *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x27:
            jet_context::set_fragment_constant_value((_QWORD **)this, *(double *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x28:
            jet_context::set_fragment_constant_value((_QWORD **)this, *(__n128 *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x29:
            jet_context::set_fragment_constant_value((_QWORD **)this, *(__n128 *)(v8 + 192 * v5 + 128));
            goto LABEL_76;
          case 0x2A:
            (*(void (**)(uint64_t *__return_ptr, jet_context *, _QWORD, _QWORD, __n128))(*(_QWORD *)this
                                                                                                 + 160))(&v59, this, *(_QWORD *)(v8 + 192 * v5 + 112), *(_QWORD *)(v9 + 120), *(__n128 *)(v8 + 192 * v5 + 128));
            v21 = v60;
            if (v60)
            {
              v22 = (unint64_t *)&v60->__shared_owners_;
              do
                v23 = __ldaxr(v22);
              while (__stlxr(v23 - 1, v22));
LABEL_56:
              if (!v23)
              {
                ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
                std::__shared_weak_count::__release_weak(v21);
              }
            }
            goto LABEL_76;
          case 0x2B:
            std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100]((uint64_t)v69, v8 + 192 * v5 + 72);
            (*(void (**)(jet_context *, _BYTE *))(*(_QWORD *)this + 344))(this, v69);
            v45 = v70;
            if (v70 == v69)
            {
              v46 = 4;
              v45 = v69;
              goto LABEL_75;
            }
            if (v70)
            {
              v46 = 5;
LABEL_75:
              (*(void (**)(void))(*v45 + 8 * v46))();
            }
LABEL_76:
            if (++v5 == v7)
              return;
            break;
          default:
            goto LABEL_76;
        }
      }
    }
  }
}

void sub_2144CC77C(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = *(_QWORD **)(v2 - 80);
  if (v4 == v1)
  {
    v5 = 4;
    v4 = (_QWORD *)(v2 - 104);
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void jet_command_buffer::~jet_command_buffer(jet_command_buffer *this)
{
  void **v1;

  *(_QWORD *)this = off_24D1A38D0;
  v1 = (void **)((char *)this + 8);
  std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v2;

  *(_QWORD *)this = off_24D1A38D0;
  v2 = (void **)((char *)this + 8);
  std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](&v2);
  MEMORY[0x2199CF8AC](this, 0xA1C4030951706);
}

double jet_context::submit_command_buffer_impl@<D0>(jet_context *this@<X0>, jet_command_buffer *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  double result;
  __int128 v14;

  (*(void (**)(jet_context *))(*(_QWORD *)this + 352))(this);
  jet_context::execute_command_buffer(this, a2);
  v6 = *((_QWORD *)this + 5);
  if (!v6)
  {
    (*(void (**)(__int128 *__return_ptr, jet_context *))(*(_QWORD *)this + 176))(&v14, this);
    std::shared_ptr<jet_fence>::operator=[abi:ne180100]((uint64_t)this + 40, &v14);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
    if (*((_QWORD *)&v14 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v6 = *((_QWORD *)this + 5);
  }
  v10 = *((_QWORD *)this + 6);
  *a3 = v6;
  a3[1] = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  std::shared_ptr<jet_fence>::reset[abi:ne180100]((_QWORD *)this + 5);
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)&result = 3;
  *((_QWORD *)this + 3) = 3;
  *((_DWORD *)this + 8) = 0;
  return result;
}

uint64_t std::shared_ptr<jet_fence>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t jet_context::set_vertex_buffer(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 16))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t))(*a1)[32])(a1, a3, result);
  return result;
}

uint64_t jet_context::set_vertex_texture(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)a3 + 88))(a3))
    jet_context::set_vertex_texture();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(*a1[1] + 32))(a1[1], a2);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t))(*a1)[35])(a1, a3, result);
  return result;
}

uint64_t jet_context::set_vertex_constant(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t))(*a1)[33])(a1, a3, result);
  return result;
}

uint64_t jet_context::set_fragment_texture(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)a3 + 88))(a3))
    jet_context::set_fragment_texture();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(*a1[1] + 56))(a1[1], a2);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t))(*a1)[39])(a1, a3, result);
  return result;
}

uint64_t jet_context::set_fragment_constant(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t))(*a1)[37])(a1, a3, result);
  return result;
}

uint64_t jet_context::set_vertex_constant_value(_QWORD **a1, float a2)
{
  uint64_t result;
  float v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, float *, uint64_t))(*a1)[34])(a1, 0, 1, 1, &v4, result);
  return result;
}

uint64_t jet_context::set_vertex_constant_value(_QWORD **a1, double a2)
{
  uint64_t result;
  double v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, double *, uint64_t))(*a1)[34])(a1, 0, 2, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  double v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, double *, uint64_t))(*a1)[34])(a1, 5, 2, 1, &v4, result);
  return result;
}

uint64_t jet_context::set_vertex_constant_value(_QWORD **a1, __n128 a2)
{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 0, 3, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 0, 4, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 5, 3, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 5, 4, 1, &v4, result);
  return result;
}

uint64_t jet_context::set_vertex_constant_value(_QWORD **a1, double a2, double a3)
{
  uint64_t result;
  _QWORD v5[2];

  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))(*a1)[34])(a1, 6, 1, 1, v5, result);
  return result;
}

uint64_t jet_context::set_vertex_constant_value(_QWORD **a1, __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t result;
  _OWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[34])(a1, 7, 1, 1, v6, result);
  return result;
}

uint64_t jet_context::set_vertex_constant_value(_QWORD **a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  uint64_t result;
  _OWORD v7[4];

  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[34])(a1, 8, 1, 1, v7, result);
  return result;
}

uint64_t jet_context::set_vertex_constant_value(_QWORD **a1, uint64_t a2, int a3)
{
  uint64_t result;
  int v5;

  v5 = a3;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, int *, uint64_t))(*a1)[34])(a1, 5, 1, 1, &v5, result);
  return result;
}

uint64_t jet_context::set_fragment_constant_value(_QWORD **a1, float a2)
{
  uint64_t result;
  float v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, float *, uint64_t))(*a1)[38])(a1, 0, 1, 1, &v4, result);
  return result;
}

uint64_t jet_context::set_fragment_constant_value(_QWORD **a1, double a2)
{
  uint64_t result;
  double v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, double *, uint64_t))(*a1)[38])(a1, 0, 2, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  double v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, double *, uint64_t))(*a1)[38])(a1, 5, 2, 1, &v4, result);
  return result;
}

uint64_t jet_context::set_fragment_constant_value(_QWORD **a1, __n128 a2)
{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 0, 3, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, _QWORD, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 0, 4, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 5, 3, 1, &v4, result);
  return result;
}

{
  uint64_t result;
  __n128 v4;

  v4 = a2;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 5, 4, 1, &v4, result);
  return result;
}

uint64_t jet_context::set_fragment_constant_value(_QWORD **a1, double a2, double a3)
{
  uint64_t result;
  _QWORD v5[2];

  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))(*a1)[38])(a1, 6, 1, 1, v5, result);
  return result;
}

uint64_t jet_context::set_fragment_constant_value(_QWORD **a1, __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t result;
  _OWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[38])(a1, 7, 1, 1, v6, result);
  return result;
}

uint64_t jet_context::set_fragment_constant_value(_QWORD **a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  uint64_t result;
  _OWORD v7[4];

  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[38])(a1, 8, 1, 1, v7, result);
  return result;
}

uint64_t jet_context::set_fragment_constant_value(_QWORD **a1, uint64_t a2, int a3)
{
  uint64_t result;
  int v5;

  v5 = a3;
  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t, uint64_t, int *, uint64_t))(*a1)[38])(a1, 5, 1, 1, &v5, result);
  return result;
}

uint64_t jet_context::set_vertex_sampler(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 40))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t))(*a1)[36])(a1, a3, result);
  return result;
}

uint64_t jet_context::set_fragment_sampler(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD *))(*a1[1] + 64))(a1[1]);
  if ((result & 0x80000000) == 0)
    return ((uint64_t (*)(_QWORD **, uint64_t, uint64_t))(*a1)[40])(a1, a3, result);
  return result;
}

uint64_t jet_context::change_render_mode(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, char a6, uint64_t a7, char a8, unsigned int a9, char a10, unsigned int a11, char a12, unsigned __int8 a13, unsigned __int8 a14, BOOL a15, BOOL a16)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int16 v30;

  v23 = a14;
  v24 = a13;
  v25 = a11;
  v26 = a9;
  v27 = *(_QWORD *)(a1 + 8);
  if (!v27)
  {
    if (!a2)
      a3 = 0;
    if (a4)
      a5 = a5;
    else
      a5 = 0;
    if ((a6 & 1) != 0)
    {
      if ((a8 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      a7 = *(unsigned int *)(a1 + 24);
      if ((a8 & 1) != 0)
      {
LABEL_16:
        if ((a10 & 1) != 0)
        {
LABEL_18:
          if ((a12 & 1) != 0)
            v24 = a13;
          else
            v24 = 1;
          if ((a12 & 1) != 0)
            v23 = a14;
          else
            v23 = 1;
          if ((a12 & 1) == 0)
          {
            a15 = 1;
            a16 = 1;
          }
          goto LABEL_32;
        }
LABEL_17:
        v25 = *(unsigned int *)(a1 + 32);
        goto LABEL_18;
      }
    }
    v26 = *(unsigned int *)(a1 + 28);
    if ((a10 & 1) != 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  if ((a2 & 1) != 0)
  {
    if ((a4 & 1) != 0)
      goto LABEL_4;
  }
  else
  {
    a3 = *(_QWORD *)(v27 + 8);
    if ((a4 & 1) != 0)
    {
LABEL_4:
      if ((a6 & 1) != 0)
        goto LABEL_5;
      goto LABEL_28;
    }
  }
  a5 = *(unsigned int *)(v27 + 16);
  if ((a6 & 1) != 0)
  {
LABEL_5:
    if ((a8 & 1) != 0)
      goto LABEL_6;
LABEL_29:
    v26 = *(unsigned int *)(a1 + 28);
    if ((a10 & 1) != 0)
    {
LABEL_7:
      if ((a12 & 1) != 0)
        goto LABEL_32;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_28:
  a7 = *(unsigned int *)(a1 + 24);
  if ((a8 & 1) == 0)
    goto LABEL_29;
LABEL_6:
  if ((a10 & 1) != 0)
    goto LABEL_7;
LABEL_30:
  v25 = *(unsigned int *)(a1 + 32);
  if ((a12 & 1) == 0)
  {
LABEL_31:
    v24 = *(_BYTE *)(v27 + 32) != 0;
    v23 = *(_BYTE *)(v27 + 33) != 0;
    a15 = *(_BYTE *)(v27 + 34) != 0;
    a16 = *(_BYTE *)(v27 + 35) != 0;
  }
LABEL_32:
  HIBYTE(v30) = a16;
  LOBYTE(v30) = a15;
  v28 = jet_context::lookup_render_mode(a1, a3, a5, a7, v26, v25, v24, v23, v30, *(_DWORD *)(a1 + 36));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 200))(a1, v28);
}

uint64_t jet_context::create_texture_2d(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int, uint64_t))(*(_QWORD *)a1 + 248))(a1, 0, a4, a2, a3, 1, a6, 1, a7, a5);
}

uint64_t jet_context::create_texture_cube(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  uint64_t v15;

  v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _DWORD, _QWORD))(*(_QWORD *)a1 + 248))(a1, 2, a4, a2, a3, 1, a11, 1, 0, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v15 + 56))(v15, a5, 0, 0, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v15 + 56))(v15, a6, 0, 1, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v15 + 56))(v15, a7, 0, 2, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v15 + 56))(v15, a8, 0, 3, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v15 + 56))(v15, a9, 0, 4, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v15 + 56))(v15, a10, 0, 5, 0);
  return v15;
}

double jet_context::create_framebuffer(jet_context *this)
{
  uint64_t v1;
  double result;

  v1 = operator new();
  *(_QWORD *)v1 = &off_24D1A4890;
  *(_DWORD *)(v1 + 216) = 1065353216;
  *(_QWORD *)(v1 + 220) = 0x100000001;
  *(_QWORD *)(v1 + 232) = 0;
  *(_QWORD *)(v1 + 240) = 0x100000000;
  *(_DWORD *)(v1 + 248) = 1;
  *(_QWORD *)(v1 + 16) = 0;
  result = 0.0;
  *(_OWORD *)(v1 + 32) = xmmword_2144DDBB0;
  *(_QWORD *)(v1 + 48) = 1;
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0;
  *(_OWORD *)(v1 + 80) = xmmword_2144DDBB0;
  *(_DWORD *)(v1 + 96) = 1;
  *(_QWORD *)(v1 + 100) = 0;
  *(_QWORD *)(v1 + 116) = 0;
  *(_QWORD *)(v1 + 108) = 0;
  *(_DWORD *)(v1 + 124) = 0;
  *(_OWORD *)(v1 + 128) = xmmword_2144DDBB0;
  *(_DWORD *)(v1 + 144) = 1;
  *(_QWORD *)(v1 + 164) = 0;
  *(_DWORD *)(v1 + 172) = 0;
  *(_QWORD *)(v1 + 148) = 0;
  *(_QWORD *)(v1 + 156) = 0;
  *(_OWORD *)(v1 + 176) = xmmword_2144DDBB0;
  *(_QWORD *)(v1 + 192) = 1;
  *(_QWORD *)(v1 + 200) = 0;
  *(_QWORD *)(v1 + 208) = 0;
  return result;
}

uint64_t jet_context::lookup_render_mode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9, int a10)
{
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t **v21;
  _DWORD v23[6];
  uint64_t v24;

  if (!a2)
    return 0;
  v17 = a7 | 2;
  if (!(_DWORD)a8)
    v17 = a7;
  if ((_BYTE)a9)
    v17 |= 4u;
  if (HIBYTE(a9))
    v17 |= 8u;
  v23[0] = a3;
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  v23[4] = v17;
  v23[5] = a10;
  v21 = (uint64_t **)(a2 + 8);
  v18 = std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::find<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(a2 + 8, v23);
  if (a2 + 16 == v18)
  {
    v24 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __int16))(*(_QWORD *)a1 + 88))(a1, a2, a3, a4, a5, a6, a7, a8, a9);
    v19 = &v24;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__emplace_unique_key_args<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>&,jet_render_mode *&>(v21, v23, (uint64_t)v23, &v24);
  }
  else
  {
    v19 = (uint64_t *)(v18 + 56);
  }
  return *v19;
}

uint64_t jet_context::change_blend_mode(uint64_t a1, uint64_t a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 1, a2, 0, 0, 0, 0, 0, 0, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_color_mask(jet_context *this, unsigned __int8 a2, unsigned __int8 a3, BOOL a4, BOOL a5)
{
  return jet_context::change_render_mode((uint64_t)this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, a2, a3, a4, a5);
}

uint64_t jet_context::change_dest_color_format(uint64_t a1, uint64_t a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 0, 0, 1, a2, 0, 0, 0, 0, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_dest_depth_format(uint64_t a1, unsigned int a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 0, 0, 0, 0, 1, a2, 0, 0, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_dest_stencil_format(uint64_t a1, unsigned int a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 0, 0, 0, 0, 0, 0, 1, a2, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_program(jet_context *this, jet_program *a2)
{
  return jet_context::change_render_mode((uint64_t)this, 1, (uint64_t)a2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1u, 1u, 1, 1);
}

_QWORD *jet_context::add_fenced_buffer(jet_context *this, jet_buffer *a2)
{
  char *v2;
  char *v4;
  jet_buffer *v5;

  v5 = a2;
  *((_BYTE *)a2 + 8) = 1;
  v2 = (char *)this + 56;
  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__emplace_unique_key_args<jet_buffer *,jet_buffer * const&>((uint64_t)this + 56, &v5, &v5);
  v4 = v2;
  return std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__emplace_unique_key_args<std::unordered_set<jet_buffer *> *,std::unordered_set<jet_buffer *> *>((uint64_t)v5 + 56, &v4, &v4);
}

_QWORD *jet_context::clear_fenced_buffers(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  _QWORD *i;
  uint64_t v5;
  _QWORD *v7;

  v2 = (_QWORD *)(a1 + 56);
  for (i = *(_QWORD **)(a1 + 72); i; i = (_QWORD *)*i)
  {
    v5 = i[2];
    v7 = v2;
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>((_QWORD *)(v5 + 56), &v7);
    std::shared_ptr<jet_fence>::operator=[abi:ne180100]((_QWORD *)(v5 + 24), a2);
    *(_BYTE *)(v5 + 8) = 0;
    if (*(_QWORD *)(v5 + 16))
    {
      while (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v5 + 16)))
        ;
    }
  }
  return std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::clear(v2);
}

_QWORD *std::shared_ptr<jet_fence>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

void jet_command_buffer::jet_command_buffer(jet_command_buffer *this, unint64_t a2)
{
  *(_QWORD *)this = off_24D1A38D0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  std::vector<jet_render_op>::reserve((uint64_t *)this + 1, a2);
}

void sub_2144CDCB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<jet_render_op>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 6) < a2)
  {
    if (a2 >= 0x155555555555556)
      std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<jet_render_op>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 192 * v6;
    std::vector<jet_render_op>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<jet_render_op>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_2144CDD6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<jet_render_op>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<jet_render_op>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

uint64_t std::vector<jet_render_op>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<jet_render_op>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<jet_render_op>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x155555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(192 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<jet_render_op>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = a7 - 192;
  while (a3 + v11 != a5)
  {
    v13 = v12 + v11;
    v11 -= 192;
    std::allocator<jet_render_op>::construct[abi:ne180100]<jet_render_op,jet_render_op const&>(a1, v13, v11 + a3);
  }
  return a6;
}

__n128 std::allocator<jet_render_op>::construct[abi:ne180100]<jet_render_op,jet_render_op const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::string *v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)a2 = &off_24D1A3900;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a3 + 8);
  v5 = (std::string *)(a2 + 16);
  if (*(char *)(a3 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a3 + 16), *(_QWORD *)(a3 + 24));
  }
  else
  {
    v6 = *(_OWORD *)(a3 + 16);
    *(_QWORD *)(a2 + 32) = *(_QWORD *)(a3 + 32);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100](a2 + 40, a3 + 40);
  std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100](a2 + 72, a3 + 72);
  *(_OWORD *)(a2 + 112) = *(_OWORD *)(a3 + 112);
  result = *(__n128 *)(a3 + 128);
  v8 = *(_OWORD *)(a3 + 144);
  v9 = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a3 + 160);
  *(_OWORD *)(a2 + 176) = v9;
  *(__n128 *)(a2 + 128) = result;
  *(_OWORD *)(a2 + 144) = v8;
  return result;
}

void sub_2144CE014(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;

  v5 = *(_QWORD **)(v1 + 64);
  if (v5 == v3)
  {
    v6 = 4;
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v6 = 5;
    v3 = *(_QWORD **)(v1 + 64);
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_6:
  if (*(char *)(v1 + 39) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void jet_render_op::~jet_render_op(jet_render_op *this)
{
  jet_render_op::~jet_render_op(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  char *v2;
  char *v3;
  uint64_t v4;
  jet_render_op *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24D1A3900;
  v2 = (char *)this + 72;
  v3 = (char *)*((_QWORD *)this + 12);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (jet_render_op *)*((_QWORD *)this + 8);
  if (v5 == (jet_render_op *)((char *)this + 40))
  {
    v6 = 4;
    v5 = (jet_render_op *)((char *)this + 40);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::__split_buffer<jet_render_op>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void (**v4)(void);

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(void (***)(void))(i - 192);
    *(_QWORD *)(a1 + 16) = i - 192;
    (*v4)();
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  void (**v8)(char *);
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = v4 - 192;
      v7 = v4 - 192;
      do
      {
        v8 = *(void (***)(char *))v7;
        v7 -= 192;
        (*v8)(v6);
        v9 = v6 == v2;
        v6 = v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

uint64_t *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>(_QWORD *a1, _QWORD *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::find<std::unordered_set<jet_buffer *> *>(a1, a2);
  if (result)
  {
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

_QWORD *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::find<std::unordered_set<jet_buffer *> *>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v5;
    if (v5 >= *(_QWORD *)&v2)
      v7 = v5 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v5 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(_QWORD **)(*a1 + 8 * v7);
  if (!v8)
    return 0;
  result = (_QWORD *)*v8;
  if (*v8)
  {
    do
    {
      v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2)
          return result;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(_QWORD *)&v2)
            v10 %= *(_QWORD *)&v2;
        }
        else
        {
          v10 &= *(_QWORD *)&v2 - 1;
        }
        if (v10 != v7)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::find<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t *v7;
  char v9;
  char v10;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 8;
  do
  {
    v6 = std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v9, (_DWORD *)(v3 + 32), a2);
    v7 = (uint64_t *)(v3 + 8);
    if (!v6)
    {
      v7 = (uint64_t *)v3;
      v5 = v3;
    }
    v3 = *v7;
  }
  while (*v7);
  if (v5 == v2
    || std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v10, a2, (_DWORD *)(v5 + 32)))
  {
    return v2;
  }
  return v5;
}

BOOL std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3;
  unsigned int v4;
  char v6;

  if (*a2 < *a3)
    return 1;
  if (*a3 < *a2)
    return 0;
  v3 = a2[1];
  v4 = a3[1];
  if (v3 < v4)
    return 1;
  return v4 >= v3
      && std::__tuple_less<4ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v6, a2, a3);
}

BOOL std::__tuple_less<4ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v3 = a2[2];
  v4 = a3[2];
  if (v3 < v4)
    return 1;
  if (v4 < v3)
    return 0;
  v5 = a2[3];
  v6 = a3[3];
  if (v5 < v6)
    return 1;
  if (v6 < v5)
    return 0;
  v7 = a2[4];
  v8 = a3[4];
  if (v7 < v8)
    return 1;
  return v8 >= v7 && a2[5] < a3[5];
}

_OWORD *std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__emplace_unique_key_args<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>&,jet_render_mode *&>(uint64_t **a1, _DWORD *a2, uint64_t a3, uint64_t *a4)
{
  void **v7;
  _OWORD *v8;
  uint64_t **v9;
  uint64_t v10;
  uint64_t v12;

  v7 = (void **)std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__find_equal<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)a1, &v12, a2);
  v8 = *v7;
  if (!*v7)
  {
    v9 = (uint64_t **)v7;
    v8 = operator new(0x40uLL);
    v8[2] = *(_OWORD *)a3;
    v10 = *a4;
    *((_QWORD *)v8 + 6) = *(_QWORD *)(a3 + 16);
    *((_QWORD *)v8 + 7) = v10;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, v12, v9, (uint64_t *)v8);
  }
  return v8;
}

_QWORD *std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__find_equal<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;
  _DWORD *v8;
  char v10;
  char v11;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = (_QWORD *)v4;
        v8 = (_DWORD *)(v4 + 32);
        if (!std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v10, a3, (_DWORD *)(v4 + 32)))break;
        v4 = *v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (!std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v11, v8, a3))break;
      v5 = v7 + 1;
      v4 = v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

_QWORD *std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__emplace_unique_key_args<jet_buffer *,jet_buffer * const&>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD **v11;
  _QWORD *i;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v3 = v8 % v9;
    }
    else
    {
      v3 = v8 & (v9 - 1);
    }
    v11 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v8;
  i[2] = *a3;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    v16 = 1;
    if (v9 >= 3)
      v16 = (v9 & (v9 - 1)) != 0;
    v17 = v16 | (2 * v9);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v19);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v20 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v22 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9)
        v22 %= v9;
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_2144CED3C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

_QWORD *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__emplace_unique_key_args<std::unordered_set<jet_buffer *> *,std::unordered_set<jet_buffer *> *>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD **v11;
  _QWORD *i;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v3 = v8 % v9;
    }
    else
    {
      v3 = v8 & (v9 - 1);
    }
    v11 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v8;
  i[2] = *a3;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    v16 = 1;
    if (v9 >= 3)
      v16 = (v9 & (v9 - 1)) != 0;
    v17 = v16 | (2 * v9);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v19);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v20 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v22 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9)
        v22 %= v9;
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_2144CF1C0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void jet_context_OpenGL::jet_context_OpenGL(jet_context_OpenGL *this, EAGLContext *a2)
{
  EAGLContext *v3;
  EAGLContext *v4;
  EAGLContext *v5;
  uint64_t v6;
  void *v7;
  GLuint v8;
  _BYTE v9[16];

  v3 = a2;
  jet_context::jet_context(this);
  *(_QWORD *)this = &off_24D1A3970;
  v4 = v3;
  *((_QWORD *)this + 18) = 0;
  *((_QWORD *)this + 17) = (char *)this + 144;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 13) = v4;
  *((_QWORD *)this + 14) = (char *)this + 120;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 19) = 0;
  *((_DWORD *)this + 40) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 23) = 0x100000000;
  v5 = v4;
  if (!v4)
  {
    jet_createGLContext(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)this + 13);
    *((_QWORD *)this + 13) = v6;

    v5 = (EAGLContext *)*((_QWORD *)this + 13);
  }
  glContextUse::glContextUse((glContextUse *)v9, v5);
  glGenFramebuffers(1, (GLuint *)this + 45);
  v8 = *((_DWORD *)this + 45);
  *((_DWORD *)this + 46) = v8;
  glBindFramebuffer(0x8D40u, v8);
  glEnable(0xC11u);
  glDisable(0xB71u);
  glDepthFunc(0x207u);
  glDepthMask(0);
  glDisable(0xB90u);
  glContextUse::~glContextUse((glContextUse *)v9);

}

void sub_2144CF348(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v4, *(_QWORD **)(v1 + 144));
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v3, *(_QWORD **)(v1 + 120));

  jet_context::~jet_context((jet_context *)v1);
  _Unwind_Resume(a1);
}

id jet_createGLContext(EAGLContext *a1)
{
  EAGLContext *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = objc_alloc(MEMORY[0x24BDE2818]);
  -[EAGLContext sharegroup](v1, "sharegroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithAPI:sharegroup:", 2, v3);

  return v4;
}

void sub_2144CF404(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void jet_context_OpenGL::~jet_context_OpenGL(GLuint *framebuffers)
{
  const GLuint *v2;

  *(_QWORD *)framebuffers = &off_24D1A3970;
  v2 = framebuffers + 45;
  if (framebuffers[45])
  {
    glDeleteFramebuffers(1, v2);
    *v2 = 0;
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)(framebuffers + 34), *((_QWORD **)framebuffers + 18));
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)(framebuffers + 28), *((_QWORD **)framebuffers + 15));

  jet_context::~jet_context((jet_context *)framebuffers);
}

void jet_context_OpenGL::~jet_context_OpenGL(GLuint *this)
{
  jet_context_OpenGL::~jet_context_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_context_OpenGL::get_context_type(jet_context_OpenGL *this)
{
  return 0;
}

uint64_t jet_context_OpenGL::get_max_texture_size(uint64_t a1, int a2)
{
  uint64_t v3;
  GLint params;
  _BYTE v6[16];

  glContextUse::glContextUse((glContextUse *)v6, *(EAGLContext **)(a1 + 104));
  params = 0;
  if (a2 == 2)
    glGetIntegerv(0x851Cu, &params);
  else
    glGetIntegerv(0xD33u, &params);
  v3 = params;
  glContextUse::~glContextUse((glContextUse *)v6);
  return v3;
}

void sub_2144CF52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::indexForTetxure(jet_context_OpenGL *this, unsigned int a2)
{
  uint64_t v2;
  _DWORD *v3;
  unsigned int v4;
  BOOL v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int v9;
  unsigned int *v10;

  v9 = a2;
  v2 = *((_QWORD *)this + 15);
  if (!v2)
    goto LABEL_12;
  v3 = (_DWORD *)((char *)this + 120);
  do
  {
    v4 = *(_DWORD *)(v2 + 28);
    v5 = v4 >= a2;
    if (v4 >= a2)
      v6 = (uint64_t *)v2;
    else
      v6 = (uint64_t *)(v2 + 8);
    if (v5)
      v3 = (_DWORD *)v2;
    v2 = *v6;
  }
  while (*v6);
  if (v3 != (_DWORD *)((char *)this + 120) && v3[7] <= a2)
    return v3[8];
LABEL_12:
  v7 = *((unsigned int *)this + 40);
  *((_DWORD *)this + 40) = v7 + 1;
  v10 = &v9;
  *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 14, &v9, (uint64_t)&std::piecewise_construct, &v10)+ 8) = v7;
  return v7;
}

uint64_t jet_context_OpenGL::create_buffer(uint64_t a1, int a2, int a3, int a4, const GLvoid *a5)
{
  uint64_t v10;

  v10 = operator new();
  jet_buffer_OpenGL::jet_buffer_OpenGL(v10, *(void **)(a1 + 104), a2, a3, a4, a5);
  return v10;
}

void sub_2144CF660(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C402150694FLL);
  _Unwind_Resume(a1);
}

jet_buffer_pool *jet_context_OpenGL::create_buffer_pool(uint64_t a1, int a2, int a3, int a4)
{
  jet_buffer_pool *v8;

  v8 = (jet_buffer_pool *)operator new();
  jet_buffer_pool_OpenGL::jet_buffer_pool_OpenGL(v8, *(void **)(a1 + 104), a2, a3, a4);
  return v8;
}

void sub_2144CF6F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C40EB43BACFLL);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_constant(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  int v9;
  uint64_t v10;
  size_t v11;

  if ((a2 - 1) > 7)
    v9 = 4;
  else
    v9 = dword_2144DDF78[a2 - 1];
  v10 = operator new();
  jet_constant::jet_constant((jet_constant *)v10);
  *(_QWORD *)v10 = off_24D1A3C48;
  *(_DWORD *)(v10 + 8) = a2;
  *(_DWORD *)(v10 + 12) = a3;
  v11 = (a4 * a3 * v9);
  *(_DWORD *)(v10 + 16) = a4;
  *(_DWORD *)(v10 + 20) = v11;
  *(_QWORD *)(v10 + 24) = malloc_type_malloc(v11, 0x63B4B777uLL);
  if (a5)
    (*(void (**)(uint64_t, uint64_t, size_t))(*(_QWORD *)v10 + 32))(v10, a5, v11);
  return v10;
}

void sub_2144CF7DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x1081C40C006A395);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_texture(uint64_t a1, unsigned int a2, int a3, GLsizei a4, GLsizei a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  unsigned int v16;
  GLenum v17;
  GLenum v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  GLuint v22;
  const char *v24;
  int v25;
  GLuint renderbuffers;
  _BYTE v27[16];

  if (a6 != 1)
    jet_context_OpenGL::create_texture();
  if (a8 != 1)
    jet_context_OpenGL::create_texture();
  glContextUse::glContextUse((glContextUse *)v27, *(EAGLContext **)(a1 + 104));
  v16 = a3 - 10;
  if ((a3 - 10) <= 3)
  {
    if (a7)
    {
      v24 = "mip_mapped == false";
      v25 = 393;
    }
    else if (a10)
    {
      v24 = "data == nullptr";
      v25 = 394;
    }
    else
    {
      if (a2 < 2)
      {
        renderbuffers = 0;
        glGenRenderbuffers(1, &renderbuffers);
        glBindRenderbuffer(0x8D41u, renderbuffers);
        if (v16 > 3)
          v17 = 0;
        else
          v17 = dword_2144DE000[v16];
        glRenderbufferStorage(0x8D41u, v17, a4, a5);
        v20 = operator new();
        jet_texture_OpenGL::jet_texture_OpenGL((jet_texture_OpenGL *)v20, *(EAGLContext **)(a1 + 104));
        *(_DWORD *)(v20 + 32) = a4;
        *(_DWORD *)(v20 + 36) = a5;
        *(_DWORD *)(v20 + 40) = 1;
        *(_DWORD *)(v20 + 48) = 1;
        *(_BYTE *)(v20 + 44) = 0;
        *(_DWORD *)(v20 + 24) = a3;
        *(_DWORD *)(v20 + 28) = a2;
        v22 = renderbuffers;
        *(_DWORD *)(v20 + 16) = 0;
        *(_DWORD *)(v20 + 20) = v22;
        goto LABEL_21;
      }
      v24 = "type == jet_texture_type_2D || type == jet_texture_type_Rect";
      v25 = 396;
    }
    __assert_rtn("create_texture", "jet_context_OpenGL.mm", v25, v24);
  }
  renderbuffers = 0;
  glGenTextures(1, &renderbuffers);
  if (a2 == 2)
    v18 = 34067;
  else
    v18 = 3553;
  glBindTexture(v18, renderbuffers);
  glTexParameteri(v18, 0x2801u, 9729);
  glTexParameteri(v18, 0x2800u, 9729);
  glTexParameteri(v18, 0x2802u, 33071);
  glTexParameteri(v18, 0x2803u, 33071);
  if (a2 == 2)
  {
    if (a4 != a5)
      __assert_rtn("create_texture", "jet_context_OpenGL.mm", 452, "width == height");
    v19 = 6;
  }
  else
  {
    v19 = 1;
  }
  v20 = operator new();
  jet_texture_OpenGL::jet_texture_OpenGL((jet_texture_OpenGL *)v20, *(EAGLContext **)(a1 + 104));
  v21 = 0;
  *(_DWORD *)(v20 + 32) = a4;
  *(_DWORD *)(v20 + 36) = a5;
  *(_DWORD *)(v20 + 40) = 1;
  *(_DWORD *)(v20 + 48) = v19;
  *(_BYTE *)(v20 + 44) = a7 != 0;
  *(_DWORD *)(v20 + 24) = a3;
  *(_DWORD *)(v20 + 28) = a2;
  *(_QWORD *)(v20 + 16) = renderbuffers;
  do
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v20 + 56))(v20, a10, 0, v21, 0);
    v21 = (v21 + 1);
  }
  while (v19 != (_DWORD)v21);
LABEL_21:
  glContextUse::~glContextUse((glContextUse *)v27);
  return v20;
}

void sub_2144CFAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  MEMORY[0x2199CF8AC](v3, 0x1081C4088E5EABBLL);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

unsigned int *jet_context_OpenGL::get_OpenGL_Tetxure(int a1, void *lpsrc)
{
  unsigned int *result;

  if (!lpsrc)
    return 0;
  if (result)
    return (unsigned int *)result[4];
  return result;
}

unsigned int *jet_context_OpenGL::get_OpenGL_Renderbuffer(int a1, void *lpsrc)
{
  unsigned int *result;

  if (!lpsrc)
    return 0;
  if (result)
    return (unsigned int *)result[5];
  return result;
}

uint64_t jet_context_OpenGL::create_texture_from_OpenGL_Texture(uint64_t a1, int a2, int a3, int a4, int a5, char a6)
{
  uint64_t v12;

  v12 = operator new();
  jet_texture_OpenGL::jet_texture_OpenGL((jet_texture_OpenGL *)v12, *(EAGLContext **)(a1 + 104));
  objc_storeStrong((id *)(v12 + 8), *(id *)(a1 + 104));
  *(_BYTE *)(v12 + 46) = a6;
  *(_BYTE *)(v12 + 44) = 0;
  *(_DWORD *)(v12 + 32) = a3;
  *(_DWORD *)(v12 + 36) = a4;
  *(_DWORD *)(v12 + 40) = 1;
  *(_DWORD *)(v12 + 48) = 1;
  *(_DWORD *)(v12 + 24) = a5;
  *(_DWORD *)(v12 + 28) = 0;
  *(_DWORD *)(v12 + 16) = a2;
  *(_DWORD *)(v12 + 20) = 0;
  return v12;
}

void sub_2144CFC14(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x1081C4088E5EABBLL);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_texture_from_OpenGL_Renderbuffer(uint64_t a1, int a2, int a3, int a4, int a5, char a6)
{
  uint64_t v12;

  v12 = operator new();
  jet_texture_OpenGL::jet_texture_OpenGL((jet_texture_OpenGL *)v12, *(EAGLContext **)(a1 + 104));
  *(_BYTE *)(v12 + 46) = a6;
  *(_DWORD *)(v12 + 32) = a3;
  *(_DWORD *)(v12 + 36) = a4;
  *(_DWORD *)(v12 + 40) = 1;
  *(_DWORD *)(v12 + 48) = 1;
  *(_BYTE *)(v12 + 44) = 0;
  *(_DWORD *)(v12 + 24) = a5;
  *(_DWORD *)(v12 + 28) = 0;
  *(_DWORD *)(v12 + 16) = 0;
  *(_DWORD *)(v12 + 20) = a2;
  return v12;
}

void sub_2144CFCC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x1081C4088E5EABBLL);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_texture_from_IOSurface(uint64_t a1, IOSurfaceID a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6)
{
  __IOSurface *v12;
  char BytesPerRowOfPlane;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  GLuint textures;
  _BYTE v29[16];

  glContextUse::glContextUse((glContextUse *)v29, *(EAGLContext **)(a1 + 104));
  textures = 0;
  glGenTextures(1, &textures);
  glBindTexture(0xDE1u, textures);
  glTexParameteri(0xDE1u, 0x2801u, 9729);
  glTexParameteri(0xDE1u, 0x2800u, 9729);
  glTexParameteri(0xDE1u, 0x2802u, 33071);
  glTexParameteri(0xDE1u, 0x2803u, 33071);
  v12 = IOSurfaceLookup(a2);
  BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v12, a6);
  if ((BytesPerRowOfPlane & 0xF) != 0)
  {
    jet_log(CFSTR("IOSurface bytesPerRow must be a multiple of %d"), 16);
    __assert_rtn("create_texture_from_IOSurface", "jet_context_OpenGL.mm", 584, "bytesPerRow % JET_IO_SURFACE_MIN_READ_ALIGNMENT == 0");
  }
  v14 = 35056;
  v15 = 36168;
  v16 = 33189;
  v17 = 6403;
  v18 = 6408;
  v19 = 34842;
  v20 = 6403;
  switch(a5)
  {
    case 1:
      break;
    case 2:
      v20 = 33319;
      v17 = 33319;
      break;
    case 3:
    case 5:
      goto LABEL_4;
    case 4:
      goto LABEL_13;
    case 6:
      v18 = 32993;
LABEL_13:
      v20 = 32993;
      v17 = v18;
      break;
    case 10:
LABEL_5:
      v20 = 6408;
      v17 = v19;
      break;
    case 11:
LABEL_8:
      v20 = 35056;
      v17 = v14;
      break;
    case 12:
LABEL_7:
      v20 = 36168;
      v17 = v15;
      break;
    case 13:
LABEL_9:
      v20 = 33189;
LABEL_10:
      v17 = v16;
      break;
    default:
      v18 = 0;
LABEL_4:
      v20 = 0;
      v16 = v18;
      v15 = v18;
      v14 = v18;
      v19 = v18;
      v17 = v18;
      switch(a5)
      {
        case 3:
        case 5:
        case 10:
          goto LABEL_5;
        case 4:
        case 6:
          goto LABEL_13;
        case 7:
        case 8:
        case 9:
          goto LABEL_14;
        case 11:
          goto LABEL_8;
        case 12:
          goto LABEL_7;
        case 13:
          goto LABEL_9;
        default:
          goto LABEL_10;
      }
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = 5121;
  if (a5 == 10)
    v23 = 5126;
  v24 = 33639;
  if ((a5 - 3) >= 2)
    v24 = v23;
  BYTE4(v27) = 0;
  LODWORD(v27) = a6;
  if ((objc_msgSend(v21, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", v12, 3553, v17, a3, a4, v20, v24, v27) & 1) == 0)__assert_rtn("create_texture_from_IOSurface", "jet_context_OpenGL.mm", 595, "result");
  CFRelease(v12);
  v25 = operator new();
  jet_texture_OpenGL::jet_texture_OpenGL((jet_texture_OpenGL *)v25, *(EAGLContext **)(a1 + 104));
  *(_DWORD *)(v25 + 32) = a3;
  *(_DWORD *)(v25 + 36) = a4;
  *(_DWORD *)(v25 + 40) = 1;
  *(_DWORD *)(v25 + 48) = 1;
  *(_BYTE *)(v25 + 44) = 0;
  *(_DWORD *)(v25 + 24) = a5;
  *(_DWORD *)(v25 + 28) = 0;
  *(_QWORD *)(v25 + 16) = textures;
  *(_BYTE *)(v25 + 45) = (BytesPerRowOfPlane & 0x1F) != 0;

  glContextUse::~glContextUse((glContextUse *)v29);
  return v25;
}

void sub_2144CFFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  void *v6;
  va_list va;

  va_start(va, a5);
  MEMORY[0x2199CF8AC](v5, 0x1081C4088E5EABBLL);

  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_sampler(uint64_t a1, unsigned int a2, unsigned int a3, int a4, int a5, int a6)
{
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v11 = operator new();
  jet_sampler::jet_sampler((jet_sampler *)v11);
  *(_QWORD *)v11 = &off_24D1A3DA0;
  *(_DWORD *)(v11 + 8) = a2;
  *(_DWORD *)(v11 + 12) = a3;
  *(_DWORD *)(v11 + 16) = a4;
  *(_DWORD *)(v11 + 20) = a5;
  *(_DWORD *)(v11 + 24) = a6;
  *(int8x8_t *)(v11 + 28) = vbsl_s8((int8x8_t)vceq_s32((int32x2_t)__PAIR64__(a3, a2), (int32x2_t)0x200000002), (int8x8_t)vdup_n_s32(0x8370u), vbsl_s8((int8x8_t)vceq_s32((int32x2_t)__PAIR64__(a3, a2), (int32x2_t)0x100000001), (int8x8_t)vdup_n_s32(0x2901u), (int8x8_t)vdup_n_s32(0x812Fu)));
  if (a4 == 1)
    v12 = 9987;
  else
    v12 = 9986;
  if (a4 == 1)
    v13 = 9729;
  else
    v13 = 9728;
  if (a4 == 1)
    v14 = 9985;
  else
    v14 = 9984;
  if (a6 == 1)
    v13 = v14;
  if (a6 != 2)
    v12 = v13;
  if (a5 == 1)
    v15 = 9729;
  else
    v15 = 9728;
  *(_DWORD *)(v11 + 36) = v12;
  *(_DWORD *)(v11 + 40) = v15;
  return v11;
}

void sub_2144D0100(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x1081C408C76C282);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_function(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResource:ofType:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"), 0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, objc_msgSend(v13, "UTF8String"), a3, a4, a5);

  return v14;
}

void sub_2144D0214(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_function_from_source(uint64_t a1, GLchar *a2, uint64_t a3, int a4, _QWORD *a5)
{
  EAGLContext *v6;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  GLuint v13;
  id v14;
  GLuint v16;
  _BYTE v17[16];

  v6 = *(EAGLContext **)(a1 + 104);
  if (!v6)
    return 0;
  glContextUse::glContextUse((glContextUse *)v17, v6);
  v16 = 0;
  if (a4 == 2)
    v10 = 35632;
  else
    v10 = 35633;
  if (xglCompileShader(&v16, v10, a2, a5))
  {
    v11 = operator new();
    v12 = *(void **)(a1 + 104);
    v13 = v16;
    v14 = v12;
    *(_QWORD *)v11 = &off_24D1A3DD8;
    *(_QWORD *)(v11 + 8) = v14;
    *(_DWORD *)(v11 + 16) = v13;
  }
  else
  {
    v11 = 0;
  }
  glContextUse::~glContextUse((glContextUse *)v17);
  return v11;
}

void sub_2144D0308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

jet_program_OpenGL *jet_context_OpenGL::create_program(uint64_t a1, const void *a2, const void *a3)
{
  unsigned int v6;
  xglProgram *v7;
  jet_program_OpenGL *v8;
  _BYTE v10[16];

  glContextUse::glContextUse((glContextUse *)v10, *(EAGLContext **)(a1 + 104));
  v7 = (xglProgram *)operator new();
  xglProgram::xglProgram(v7, a2, v6, *(EAGLContext **)(a1 + 104));
  v8 = (jet_program_OpenGL *)operator new();
  jet_program_OpenGL::jet_program_OpenGL(v8, *(EAGLContext **)(a1 + 104), v7);
  glContextUse::~glContextUse((glContextUse *)v10);
  return v8;
}

void sub_2144D0408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  MEMORY[0x2199CF8AC](v9, 0x10A1C40FE1D3F04);
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_render_mode(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, char a7, char a8, char a9, char a10, int a11)
{
  uint64_t v17;

  v17 = operator new();
  jet_render_mode::jet_render_mode((jet_render_mode *)v17);
  *(_QWORD *)v17 = &off_24D1A3E58;
  *(_QWORD *)(v17 + 40) = 0;
  objc_storeStrong((id *)(v17 + 40), *(id *)(a1 + 104));
  *(_QWORD *)(v17 + 8) = a2;
  *(_DWORD *)(v17 + 16) = a3;
  *(_DWORD *)(v17 + 20) = a4;
  *(_DWORD *)(v17 + 24) = a5;
  *(_DWORD *)(v17 + 28) = a6;
  *(_BYTE *)(v17 + 32) = a7;
  *(_BYTE *)(v17 + 33) = a8;
  *(_BYTE *)(v17 + 34) = a9;
  *(_BYTE *)(v17 + 35) = a10;
  *(_DWORD *)(v17 + 36) = a11;
  return v17;
}

void sub_2144D0528(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C408F04D72DLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::begin_render_pass(jet_context_OpenGL *this, GLfloat *lpsrc)
{
  _DWORD *v4;
  GLuint v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  unint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  GLuint v13;
  char v14;
  GLuint v15;
  GLuint v16;
  int v17;
  GLenum v18;
  GLbitfield v19;
  GLsizei v20;
  GLsizei v21;
  GLbitfield v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  GLBOOLean flag[4];
  GLBOOLean v28;
  GLBOOLean params;
  GLBOOLean green;
  GLBOOLean blue;
  GLBOOLean alpha;
  uint64_t v33;
  std::__shared_weak_count *v34;

  if (!lpsrc)
    return;
  *((_QWORD *)this + 2) = lpsrc;
  if (v4)
  {
    v5 = v4[66];
    if ((v5 & 0x80000000) == 0)
    {
      if (*((_DWORD *)this + 46) != v5)
      {
        (*(void (**)(uint64_t *__return_ptr, jet_context_OpenGL *))(*(_QWORD *)this + 176))(&v33, this);
        v6 = v34;
        if (v34)
        {
          p_shared_owners = (unint64_t *)&v34->__shared_owners_;
          do
            v8 = __ldaxr(p_shared_owners);
          while (__stlxr(v8 - 1, p_shared_owners));
          if (!v8)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
        }
        glBindFramebuffer(0x8D40u, v5);
        *((_DWORD *)this + 46) = v5;
      }
      if (*((_DWORD *)lpsrc + 12) == 1)
      {
        glClearColor(lpsrc[8], lpsrc[9], lpsrc[10], lpsrc[11]);
        v9 = 0x4000;
      }
      else
      {
        v9 = 0;
      }
      if (*((_DWORD *)lpsrc + 55) == 1)
        v19 = v9 | 0x100;
      else
        v19 = v9;
      if (v19)
      {
        flag[0] = 1;
        if (v19 >= 0x4000)
        {
          glGetBooleanv(0xC23u, &params);
          glColorMask(1u, 1u, 1u, 1u);
        }
        if ((v19 & 0x100) != 0)
        {
          glGetBooleanv(0xB72u, flag);
          glDepthMask(1u);
        }
        glClear(v19);
        if (v19 >= 0x4000)
          glColorMask(params, green, blue, alpha);
        if ((v19 & 0x100) != 0)
          glDepthMask(flag[0]);
      }
      return;
    }
  }
  v10 = *((_QWORD *)lpsrc + 2);
  v11 = (_DWORD *)*((_QWORD *)lpsrc + 29);
  v12 = *((_QWORD *)lpsrc + 26);
  if (v10 && ((*(uint64_t (**)(_QWORD))(*(_QWORD *)v10 + 96))(*((_QWORD *)lpsrc + 2)) & 1) == 0)
    jet_context_OpenGL::begin_render_pass();
  if (v12 && ((*(uint64_t (**)(unint64_t))(*(_QWORD *)v12 + 104))(v12) & 1) == 0)
    jet_context_OpenGL::begin_render_pass();
  if (v11)
  {
    if (((*(uint64_t (**)(_DWORD *))(*(_QWORD *)v11 + 112))(v11) & 1) == 0)
      jet_context_OpenGL::begin_render_pass();
  }
  else if (!(v10 | v12))
  {
    v13 = 0;
    v14 = 1;
    goto LABEL_23;
  }
  v14 = 0;
  v13 = *((_DWORD *)this + 45);
LABEL_23:
  if (*((_DWORD *)this + 46) != v13)
  {
    glBindFramebuffer(0x8D40u, v13);
    *((_DWORD *)this + 46) = v13;
  }
  if (v10)
  {
    *((_DWORD *)this + 6) = (*(uint64_t (**)(unint64_t))(*(_QWORD *)v10 + 32))(v10);
    v15 = *(_DWORD *)(v10 + 16);
    v16 = *(_DWORD *)(v10 + 20);
    v17 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)v10 + 24))(v10);
    if (v15)
    {
      if (v17 == 2)
        v18 = 34067;
      else
        v18 = 3553;
      glBindTexture(v18, v15);
      glFramebufferTexture2D(0x8D40u, 0x8CE0u, v18, v15, 0);
    }
    else if (v16)
    {
      glBindRenderbuffer(0x8D41u, v16);
      glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, v16);
    }
    v20 = (**(uint64_t (***)(unint64_t))v10)(v10);
    v21 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)v10 + 8))(v10);
    glViewport(0, 0, v20, v21);
    glScissor(0, 0, v20, v21);
  }
  else
  {
    *((_DWORD *)this + 6) = 3;
  }
  if (*((_DWORD *)lpsrc + 12) == 1 && ((v14 & 1) != 0 || *((_QWORD *)lpsrc + 2)))
  {
    glClearColor(lpsrc[8], lpsrc[9], lpsrc[10], lpsrc[11]);
    v22 = 0x4000;
    if (!v13)
      goto LABEL_57;
  }
  else
  {
    v22 = 0;
    if (!v13)
      goto LABEL_57;
  }
  if (v11)
    LODWORD(v11) = v11[5];
  glBindRenderbuffer(0x8D41u, (GLuint)v11);
  glFramebufferRenderbuffer(0x8D40u, 0x8D20u, 0x8D41u, (GLuint)v11);
LABEL_57:
  if (*((_DWORD *)lpsrc + 61) == 1 && ((v14 & 1) != 0 || *((_QWORD *)lpsrc + 29)))
  {
    glClearStencil(*((unsigned __int8 *)lpsrc + 240));
    v22 |= 0x400u;
  }
  if (v13)
  {
    if (v12)
      LODWORD(v12) = *(_DWORD *)(v12 + 20);
    glBindRenderbuffer(0x8D41u, v12);
    glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, v12);
  }
  if (*((_DWORD *)lpsrc + 55) == 1 && ((v14 & 1) != 0 || *((_QWORD *)lpsrc + 26)))
    v22 |= 0x100u;
  if (v10)
  {
    v23 = (**(uint64_t (***)(unint64_t))v10)(v10);
    v24 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)v10 + 8))(v10);
    (*(void (**)(jet_context_OpenGL *, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)this + 208))(this, 0, 0, v23, v24);
    v25 = (**(uint64_t (***)(unint64_t))v10)(v10);
    v26 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)v10 + 8))(v10);
    (*(void (**)(jet_context_OpenGL *, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)this + 224))(this, 0, 0, v25, v26);
  }
  if (v22)
  {
    v28 = 1;
    *(_DWORD *)flag = -1;
    if ((v22 & 0x4000) != 0)
    {
      glGetBooleanv(0xC23u, &params);
      glColorMask(1u, 1u, 1u, 1u);
      if ((v22 & 0x100) == 0)
      {
LABEL_74:
        if ((v22 & 0x400) == 0)
          goto LABEL_76;
        goto LABEL_75;
      }
    }
    else if ((v22 & 0x100) == 0)
    {
      goto LABEL_74;
    }
    glGetBooleanv(0xB72u, &v28);
    glDepthMask(1u);
    if ((v22 & 0x400) == 0)
    {
LABEL_76:
      glClear(v22);
      if ((v22 & 0x4000) != 0)
      {
        glColorMask(params, green, blue, alpha);
        if ((v22 & 0x100) == 0)
        {
LABEL_78:
          if ((v22 & 0x400) == 0)
            return;
          goto LABEL_79;
        }
      }
      else if ((v22 & 0x100) == 0)
      {
        goto LABEL_78;
      }
      glDepthMask(v28);
      if ((v22 & 0x400) == 0)
        return;
LABEL_79:
      glStencilMask(*(GLuint *)flag);
      return;
    }
LABEL_75:
    glGetIntegerv(0xB98u, (GLint *)flag);
    glStencilMask(0xFFFFFFFF);
    goto LABEL_76;
  }
}

jet_stencil_mode *jet_context_OpenGL::create_stencil_mode(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  jet_stencil_mode *v13;

  v13 = (jet_stencil_mode *)operator new();
  jet_stencil_mode::jet_stencil_mode(v13);
  *(_QWORD *)v13 = &off_24D1A3ED0;
  *((_DWORD *)v13 + 2) = a2;
  *((_DWORD *)v13 + 3) = a3;
  *((_DWORD *)v13 + 4) = a4;
  *((_DWORD *)v13 + 5) = a5;
  *((_DWORD *)v13 + 6) = a6;
  *((_DWORD *)v13 + 7) = a7;
  return v13;
}

void sub_2144D0AF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x1081C40ABB4582ELL);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_depth_stencil_mode(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a5)
    v8 = a5;
  else
    v8 = a4;
  v9 = operator new();
  jet_depth_stencil_mode::jet_depth_stencil_mode((jet_depth_stencil_mode *)v9);
  *(_QWORD *)v9 = &off_24D1A3F08;
  *(_BYTE *)(v9 + 8) = a2;
  *(_DWORD *)(v9 + 12) = a3;
  if (a4)
  {
    v10 = operator new();
    *(_QWORD *)v10 = &off_24D1A3ED0;
    *(_OWORD *)(v10 + 8) = *(_OWORD *)(a4 + 8);
    *(_QWORD *)(v10 + 24) = *(_QWORD *)(a4 + 24);
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(v9 + 16) = v10;
  if (v8)
  {
    v11 = operator new();
    *(_QWORD *)v11 = &off_24D1A3ED0;
    *(_OWORD *)(v11 + 8) = *(_OWORD *)(v8 + 8);
    *(_QWORD *)(v11 + 24) = *(_QWORD *)(v8 + 24);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)(v9 + 24) = v11;
  return v9;
}

void sub_2144D0C0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C401F6D444CLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::set_stencil_reference_value(jet_context_OpenGL *this, unsigned __int8 a2)
{
  GLint v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GLenum v8;
  uint64_t v9;
  GLenum v10;

  v2 = a2;
  *((_DWORD *)this + 44) = a2;
  v3 = *((_QWORD *)this + 21);
  if (v3)
  {
    v5 = *(_QWORD *)(v3 + 16);
    v6 = *(_QWORD *)(v3 + 24);
    v7 = *(int *)(v5 + 8);
    if (v7 > 7)
      v8 = 519;
    else
      v8 = dword_2144DDF10[v7];
    v9 = *(int *)(v6 + 8);
    if (v9 > 7)
      v10 = 519;
    else
      v10 = dword_2144DDF10[v9];
    glStencilFuncSeparate(0x404u, v8, v2, *(_DWORD *)(v5 + 24));
    glStencilFuncSeparate(0x405u, v10, *((_DWORD *)this + 44), *(_DWORD *)(v6 + 24));
  }
}

void jet_context_OpenGL::set_scissor_rect(jet_context_OpenGL *this, GLint x, GLint y, GLsizei width, GLsizei height)
{
  glScissor(x, y, width, height);
}

void jet_context_OpenGL::use_depth_stencil_mode(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  GLenum v7;
  uint64_t v8;
  GLenum v9;
  uint64_t v10;
  GLenum v11;
  uint64_t v12;
  GLenum v13;
  uint64_t v14;
  GLenum v15;
  uint64_t v16;
  GLenum v17;
  uint64_t v18;
  GLenum v19;
  uint64_t v20;
  GLenum v21;
  uint64_t v22;
  GLenum v23;

  *(_QWORD *)(a1 + 168) = a2;
  if (a2)
  {
    v5 = *(_QWORD *)(a2 + 16);
    v4 = *(_QWORD *)(a2 + 24);
    v6 = *(int *)(v5 + 8);
    if (v6 > 7)
      v7 = 519;
    else
      v7 = dword_2144DDF10[v6];
    v8 = *(int *)(v4 + 8);
    if (v8 > 7)
      v9 = 519;
    else
      v9 = dword_2144DDF10[v8];
    glEnable(0xB71u);
    v10 = *(int *)(a2 + 12);
    if (v10 > 7)
      v11 = 519;
    else
      v11 = dword_2144DDF10[v10];
    glDepthFunc(v11);
    glDepthMask(*(_BYTE *)(a2 + 8));
    glEnable(0xB90u);
    v12 = *(int *)(v5 + 12);
    if (v12 > 4)
      v13 = 7680;
    else
      v13 = dword_2144DDF30[v12];
    v14 = *(int *)(v5 + 16);
    if (v14 > 4)
      v15 = 7680;
    else
      v15 = dword_2144DDF30[v14];
    v16 = *(int *)(v5 + 20);
    if (v16 > 4)
      v17 = 7680;
    else
      v17 = dword_2144DDF30[v16];
    glStencilOpSeparate(0x404u, v13, v15, v17);
    v18 = *(int *)(v4 + 12);
    if (v18 > 4)
      v19 = 7680;
    else
      v19 = dword_2144DDF30[v18];
    v20 = *(int *)(v4 + 16);
    if (v20 > 4)
      v21 = 7680;
    else
      v21 = dword_2144DDF30[v20];
    v22 = *(int *)(v4 + 20);
    if (v22 > 4)
      v23 = 7680;
    else
      v23 = dword_2144DDF30[v22];
    glStencilOpSeparate(0x405u, v19, v21, v23);
    glStencilFuncSeparate(0x404u, v7, *(unsigned __int8 *)(a1 + 176), *(unsigned __int8 *)(v5 + 24));
    glStencilFuncSeparate(0x405u, v9, *(unsigned __int8 *)(a1 + 176), *(unsigned __int8 *)(v4 + 24));
  }
  else
  {
    glDisable(0xB71u);
    glDepthFunc(0x207u);
    glDepthMask(0);
    glDisable(0xB90u);
  }
}

void jet_context_OpenGL::set_viewport(jet_context_OpenGL *this, GLint x, GLint y, GLsizei width, GLsizei height)
{
  glViewport(x, y, width, height);
}

void jet_context_OpenGL::set_blend_mode(uint64_t a1, int a2, char a3)
{
  int v6;
  GLenum v7;
  int v8;
  GLenum v9;
  GLenum v10;
  GLenum v11;
  GLenum v12;
  int v13;
  int v14;
  int v15;
  int v16;

  switch(a2)
  {
    case 1:
      if (*(_DWORD *)(a1 + 188) == 3 || (a3 & 1) == 0)
        glBlendEquation(0x8006u);
      glDisable(0xBE2u);
      break;
    case 2:
      v8 = *(_DWORD *)(a1 + 188);
      if (v8 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        v8 = *(_DWORD *)(a1 + 188);
      }
      if (v8 == 3 || (a3 & 1) == 0)
        glBlendEquation(0x8006u);
      v7 = 1;
      goto LABEL_45;
    case 3:
      if (*(_DWORD *)(a1 + 188) == 1 || (a3 & 1) == 0)
        glEnable(0xBE2u);
      glBlendEquation(0x800Bu);
      v9 = 770;
      v10 = 1;
      v11 = 0;
      v12 = 32771;
      goto LABEL_54;
    case 4:
      v13 = *(_DWORD *)(a1 + 188);
      if (v13 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        v13 = *(_DWORD *)(a1 + 188);
      }
      if (v13 == 3 || (a3 & 1) == 0)
        glBlendEquation(0x8006u);
      v9 = 774;
      v10 = 0;
      goto LABEL_53;
    case 5:
      v14 = *(_DWORD *)(a1 + 188);
      if (v14 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        v14 = *(_DWORD *)(a1 + 188);
      }
      if (v14 == 3 || (a3 & 1) == 0)
        glBlendEquation(0x8006u);
      v9 = 774;
      v10 = 768;
      goto LABEL_53;
    case 6:
      v15 = *(_DWORD *)(a1 + 188);
      if (v15 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        v15 = *(_DWORD *)(a1 + 188);
      }
      if (v15 == 3 || (a3 & 1) == 0)
        glBlendEquation(0x8006u);
      v7 = 769;
      goto LABEL_45;
    case 7:
      v16 = *(_DWORD *)(a1 + 188);
      if (v16 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        v16 = *(_DWORD *)(a1 + 188);
      }
      if (v16 == 3 || (a3 & 1) == 0)
        glBlendEquation(0x8006u);
      v9 = 774;
      v10 = 771;
LABEL_53:
      v11 = 32771;
      v12 = 0;
LABEL_54:
      glBlendFuncSeparate(v9, v10, v11, v12);
      break;
    default:
      v6 = *(_DWORD *)(a1 + 188);
      if (v6 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        v6 = *(_DWORD *)(a1 + 188);
      }
      if (v6 == 3 || (a3 & 1) == 0)
        glBlendEquation(0x8006u);
      v7 = 771;
LABEL_45:
      glBlendFunc(1u, v7);
      break;
  }
  *(_DWORD *)(a1 + 188) = a2;
}

void jet_context_OpenGL::use_render_mode(jet_context_OpenGL *this, jet_render_mode *a2)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  BOOL v9;

  v4 = (char *)this + 112;
  v5 = (char *)*((_QWORD *)this + 14);
  *((_QWORD *)this + 1) = a2;
  v6 = (char *)this + 120;
  if (v5 != (char *)this + 120)
  {
    do
    {
      glActiveTexture(*((_DWORD *)v5 + 8) + 33984);
      glBindTexture(0xDE1u, 0);
      v7 = (char *)*((_QWORD *)v5 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (char *)*((_QWORD *)v5 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v5;
          v5 = v8;
        }
        while (!v9);
      }
      v5 = v8;
    }
    while (v8 != v6);
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)v4, *((_QWORD **)this + 15));
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 14) = v6;
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)this + 136, *((_QWORD **)this + 18));
  *((_QWORD *)this + 17) = (char *)this + 144;
  *((_QWORD *)this + 19) = 0;
  *((_QWORD *)this + 18) = 0;
  *((_DWORD *)this + 40) = 0;
  glUseProgram(*(_DWORD *)(*(_QWORD *)(*((_QWORD *)a2 + 1) + 40) + 16));
  jet_context_OpenGL::set_blend_mode((uint64_t)this, *((_DWORD *)a2 + 4), 1);
  glColorMask(*((_BYTE *)a2 + 32), *((_BYTE *)a2 + 33), *((_BYTE *)a2 + 34), *((_BYTE *)a2 + 35));
}

void jet_context_OpenGL::set_vertex_buffer(jet_context_OpenGL *this, jet_buffer *a2, GLuint a3)
{
  GLuint v5;
  GLint v6;
  int v7;
  GLenum v8;

  jet_context::add_fenced_buffer(this, a2);
  if (!*((_BYTE *)a2 + 112))
    (*(void (**)(jet_buffer *, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(a2, 0, 0);
  if ((a3 & 0x80000000) != 0)
    jet_context_OpenGL::set_vertex_buffer();
  v5 = *((_DWORD *)a2 + 26);
  v6 = *((_DWORD *)a2 + 11);
  v7 = *((_DWORD *)a2 + 10) - 1;
  if (v7 > 7)
    v8 = 5126;
  else
    v8 = dword_2144DDF58[v7];
  glBindBuffer(0x8892u, v5);
  glEnableVertexAttribArray(a3);
  glVertexAttribPointer(a3, v6, v8, 1u, 0, 0);
}

void jet_context_OpenGL::set_vertex_constant(jet_context_OpenGL *this, jet_constant *a2, GLint a3)
{
  int v5;
  int v6;
  GLsizei v7;
  const GLfloat *v8;
  const GLint *v9;

  if (a3 < 0)
    jet_context_OpenGL::set_vertex_constant();
  v5 = (*(uint64_t (**)(jet_constant *))(*(_QWORD *)a2 + 8))(a2);
  v6 = (*(uint64_t (**)(jet_constant *))(*(_QWORD *)a2 + 16))(a2);
  v7 = (*(uint64_t (**)(jet_constant *))(*(_QWORD *)a2 + 24))(a2);
  switch(v5)
  {
    case 0:
      v8 = (const GLfloat *)*((_QWORD *)a2 + 3);
      switch(v6)
      {
        case 1:
          glUniform1fv(a3, v7, v8);
          break;
        case 2:
          glUniform2fv(a3, v7, v8);
          break;
        case 3:
          glUniform3fv(a3, v7, v8);
          break;
        case 4:
          glUniform4fv(a3, v7, v8);
          break;
        default:
          return;
      }
      break;
    case 5:
      v9 = (const GLint *)*((_QWORD *)a2 + 3);
      switch(v6)
      {
        case 1:
          glUniform1iv(a3, v7, v9);
          break;
        case 2:
          glUniform2iv(a3, v7, v9);
          break;
        case 3:
          glUniform3iv(a3, v7, v9);
          break;
        case 4:
          glUniform4iv(a3, v7, v9);
          break;
        default:
          return;
      }
      break;
    case 6:
      glUniformMatrix2fv(a3, v7, 0, *((const GLfloat **)a2 + 3));
      break;
    case 7:
      glUniformMatrix3fv(a3, v7, 0, *((const GLfloat **)a2 + 3));
      break;
    case 8:
      glUniformMatrix4fv(a3, v7, 0, *((const GLfloat **)a2 + 3));
      break;
    default:
      return;
  }
}

void jet_context_OpenGL::set_vertex_constant(uint64_t a1, int a2, int a3, int a4, const void *a5, uint64_t a6)
{
  int v12;
  size_t v13;
  uint64_t v14;
  uint64_t (**v15)(jet_constant_OpenGL *__hidden);
  int v16;
  int v17;
  int v18;
  int v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((a6 & 0x80000000) != 0)
    jet_context_OpenGL::set_vertex_constant();
  if (!a5)
    jet_context_OpenGL::set_vertex_constant();
  if ((a2 - 1) > 7)
    v12 = 4;
  else
    v12 = dword_2144DDF78[a2 - 1];
  jet_constant::jet_constant((jet_constant *)&v15);
  v15 = off_24D1A3C48;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a4 * a3 * v12;
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v14 - ((v13 + 15) & 0x1FFFFFFF0);
  memcpy(v20, a5, v13);
  (*(void (**)(uint64_t, uint64_t (***)(jet_constant_OpenGL *__hidden), uint64_t))(*(_QWORD *)a1 + 264))(a1, &v15, a6);
  v20 = 0;
  jet_constant_OpenGL::~jet_constant_OpenGL((jet_constant_OpenGL *)&v15);
}

void sub_2144D1568(_Unwind_Exception *a1)
{
  uint64_t v1;

  jet_constant_OpenGL::~jet_constant_OpenGL((jet_constant_OpenGL *)(v1 - 104));
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::set_vertex_texture(jet_context_OpenGL *this, jet_texture *a2, unsigned int a3)
{
  GLuint v6;
  uint64_t v7;
  GLenum v8;
  char *v9;
  char *v10;
  unsigned int v11;
  BOOL v12;
  char **v13;
  uint64_t v14;

  if ((a3 & 0x80000000) != 0)
    jet_context_OpenGL::set_vertex_texture();
  if (a2)
    v6 = *((_DWORD *)a2 + 4);
  else
    v6 = 0;
  v7 = jet_context_OpenGL::indexForTetxure(this, a3);
  glActiveTexture(v7 + 33984);
  if ((*(unsigned int (**)(jet_texture *))(*(_QWORD *)a2 + 24))(a2) == 2)
    v8 = 34067;
  else
    v8 = 3553;
  glBindTexture(v8, v6);
  v9 = (char *)*((_QWORD *)this + 18);
  if (!v9)
    goto LABEL_19;
  v10 = (char *)this + 144;
  do
  {
    v11 = *((_DWORD *)v9 + 8);
    v12 = v11 >= v7;
    if (v11 >= v7)
      v13 = (char **)v9;
    else
      v13 = (char **)(v9 + 8);
    if (v12)
      v10 = v9;
    v9 = *v13;
  }
  while (*v13);
  if (v10 != (char *)this + 144 && v7 >= *((_DWORD *)v10 + 8))
    v14 = *((_QWORD *)v10 + 5);
  else
LABEL_19:
    v14 = 0;
  (*(void (**)(jet_context_OpenGL *, uint64_t, uint64_t))(*(_QWORD *)this + 288))(this, v14, v7);
  glUniform1i(a3, v7);
}

void jet_context_OpenGL::set_vertex_sampler(uint64_t **this, jet_sampler *a2, unsigned int a3)
{
  GLint v5;
  unsigned int v6;
  unsigned int *v7;

  if ((a3 & 0x80000000) != 0)
    jet_context_OpenGL::set_vertex_sampler();
  v6 = jet_context_OpenGL::indexForTetxure((jet_context_OpenGL *)this, a3);
  v7 = &v6;
  std::__tree<std::__value_type<unsigned int,jet_sampler *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,jet_sampler *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,jet_sampler *>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 17, &v6, (uint64_t)&std::piecewise_construct, &v7)[5] = (uint64_t *)a2;
  glActiveTexture(v6 + 33984);
  if (a2)
  {
    glTexParameteri(0xDE1u, 0x2802u, *((_DWORD *)a2 + 7));
    glTexParameteri(0xDE1u, 0x2803u, *((_DWORD *)a2 + 8));
    glTexParameteri(0xDE1u, 0x2801u, *((_DWORD *)a2 + 9));
    v5 = *((_DWORD *)a2 + 10);
  }
  else
  {
    glTexParameteri(0xDE1u, 0x2802u, 33071);
    glTexParameteri(0xDE1u, 0x2803u, 33071);
    v5 = 9729;
    glTexParameteri(0xDE1u, 0x2801u, 9729);
  }
  glTexParameteri(0xDE1u, 0x2800u, v5);
}

uint64_t jet_context_OpenGL::set_fragment_constant(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 264))(a1);
}

{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1);
}

uint64_t jet_context_OpenGL::set_fragment_texture(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 280))(a1);
}

uint64_t jet_context_OpenGL::set_fragment_sampler(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 288))(a1);
}

void jet_context_OpenGL::draw(int a1, unsigned int a2, GLint first, GLsizei count)
{
  GLenum v4;

  if (a2 > 4)
    v4 = 4;
  else
    v4 = dword_2144DDF44[a2];
  glDrawArrays(v4, first, count);
}

void jet_context_OpenGL::draw_indexed(uint64_t a1, unsigned int a2, _DWORD *a3, unsigned int a4, GLsizei a5)
{
  int v5;
  int v10;
  GLenum v11;
  unsigned int v12;
  GLenum v13;
  char v14;

  v5 = a3[10];
  if ((v5 - 5) <= 0xFFFFFFFD)
    jet_context_OpenGL::draw_indexed();
  v10 = a3[11];
  glBindBuffer(0x8893u, a3[26]);
  if (a2 > 4)
    v11 = 4;
  else
    v11 = dword_2144DDF44[a2];
  v12 = a3[10] - 1;
  if (v12 > 7)
    v13 = 5126;
  else
    v13 = dword_2144DDF58[v12];
  if (v5 == 3)
    v14 = 1;
  else
    v14 = 2;
  glDrawElements(v11, a5, v13, (const GLvoid *)((v10 << v14) * (unint64_t)a4));
}

void jet_context_OpenGL::submit_commands(EAGLContext **a1, void *a2)
{
  id v3;
  _BYTE v4[16];

  v3 = a2;
  glContextUse::glContextUse((glContextUse *)v4, a1[13]);
  jet_context::submit_commands((jet_context *)a1, v3);
  glContextUse::~glContextUse((glContextUse *)v4);

}

void sub_2144D18D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  glContextUse::~glContextUse((glContextUse *)&a9);

  _Unwind_Resume(a1);
}

void jet_context_OpenGL::submit_command_buffer(EAGLContext **this@<X0>, jet_command_buffer *a2@<X1>, _QWORD *a3@<X8>)
{
  _BYTE v6[16];

  glContextUse::glContextUse((glContextUse *)v6, this[13]);
  jet_context::submit_command_buffer_impl((jet_context *)this, a2, a3);
  glContextUse::~glContextUse((glContextUse *)v6);
}

void sub_2144D1948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::present@<X0>(jet_context_OpenGL *this@<X0>, jet_texture *a2@<X1>, double a3@<D0>, _QWORD *a4@<X8>)
{
  GLuint v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int v10;
  int v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_QWORD *__return_ptr, double))(*(_QWORD *)this + 328))(a4, a3);
  v6 = *((_DWORD *)a2 + 5);
  if (!v6)
    __assert_rtn("present", "jet_context_OpenGL.mm", 1530, "glTex->_gl_RenderbufferId");
  glBindRenderbuffer(0x8D41u, v6);
  v7 = *((_QWORD *)this + 2);
  if (!v7)
    return objc_msgSend(*((id *)this + 13), "presentRenderbuffer:", 36161, v13[0]);
  v8 = *(_QWORD *)(v7 + 208);
  if (v8)
  {
    if (*(_DWORD *)(v7 + 224) == 1)
    {
      v9 = 0;
      if (*((_DWORD *)this + 46))
        v10 = 36096;
      else
        v10 = 6145;
      LODWORD(v13[0]) = v10;
      LODWORD(v8) = 1;
      goto LABEL_11;
    }
    LODWORD(v8) = 0;
  }
  v9 = 1;
LABEL_11:
  if (*(_QWORD *)(v7 + 232) && *(_DWORD *)(v7 + 248) == 1)
  {
    if (*((_DWORD *)this + 46))
      v11 = 36128;
    else
      v11 = 6146;
    *((_DWORD *)v13 + v8) = v11;
    goto LABEL_18;
  }
  if ((v9 & 1) == 0)
LABEL_18:
    glDiscardFramebufferEXT();
  return objc_msgSend(*((id *)this + 13), "presentRenderbuffer:", 36161, v13[0]);
}

void sub_2144D1AA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::commit(jet_context_OpenGL *this@<X0>, _QWORD *a2@<X8>)
{
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)this + 328))(a2);
  glFlush();
}

void sub_2144D1AE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

double jet_context_OpenGL::create_fence@<D0>(id *this@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  id v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  double result;
  __int128 v13;
  __int128 v14;

  v4 = glFenceSyncAPPLE();
  v5 = (_QWORD *)operator new();
  v6 = this[13];
  *v5 = off_24D1A3F40;
  v5[1] = v6;
  v5[2] = v4;
  std::shared_ptr<jet_fence_OpenGL>::shared_ptr[abi:ne180100]<jet_fence_OpenGL,void>(&v14, (uint64_t)v5);
  std::shared_ptr<jet_fence>::operator=[abi:ne180100](this + 5, (uint64_t *)&v14);
  v13 = v14;
  if (*((_QWORD *)&v14 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  jet_context::clear_fenced_buffers((uint64_t)this, (uint64_t *)&v13);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
  if (*((_QWORD *)&v13 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  result = *(double *)&v14;
  *a2 = v14;
  return result;
}

void sub_2144D1BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

id jet_context_OpenGL::ensureCIContext(jet_context_OpenGL *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)*((_QWORD *)this + 12);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, *MEMORY[0x24BDBF858]);

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v5, *MEMORY[0x24BDBF840]);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBF648]), "initWithEAGLContext:options:", *((_QWORD *)this + 13), v3);
    v7 = (void *)*((_QWORD *)this + 12);
    *((_QWORD *)this + 12) = v6;

    v2 = (void *)*((_QWORD *)this + 12);
  }
  return v2;
}

void sub_2144D1CDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void jet_context_OpenGL::render_CIImage_to_texture(uint64_t a1, void *a2, uint64_t a3, __n128 a4)
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  std::__shared_weak_count *v22;
  CGRect v23;

  v6 = a2;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 336))(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)a4.n128_u32[0];
  v9 = (double)a4.n128_u32[1];
  v10 = (double)a4.n128_u32[2];
  v11 = (double)a4.n128_u32[3];
  v23.origin.x = (double)a4.n128_u32[0];
  v23.origin.y = (double)a4.n128_u32[1];
  v23.size.width = (double)a4.n128_u32[2];
  v23.size.height = (double)a4.n128_u32[3];
  if (CGRectIsEmpty(v23))
  {
    objc_msgSend(v6, "extent");
    v8 = v12;
    v9 = v13;
    v10 = v14;
    v11 = v15;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)a1 + 176))(&v21, a1);
  v16 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
      if (a3)
        goto LABEL_8;
LABEL_10:
      v19 = 0;
      goto LABEL_11;
    }
  }
  if (!a3)
    goto LABEL_10;
LABEL_8:
  v19 = *(unsigned int *)(a3 + 16);
LABEL_11:
  objc_msgSend(v7, "render:toTexture:bounds:colorSpace:", v6, v19, 0, v8, v9, v10, v11, *(_OWORD *)&a4);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);

}

void sub_2144D1E5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_CIImage_from_texture(jet_context_OpenGL *this, jet_texture *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  unsigned int v6;

  v3 = (void *)MEMORY[0x24BDBF660];
  if (a2)
    v4 = *((unsigned int *)a2 + 4);
  else
    v4 = 0;
  v5 = (double)(**(unsigned int (***)(jet_texture *))a2)(a2);
  (*(void (**)(jet_texture *))(*(_QWORD *)a2 + 8))(a2);
  return objc_msgSend(v3, "imageWithTexture:size:flipped:colorSpace:", v4, 0, 0, v5, (double)v6);
}

void jet_context_OpenGL::synchronize_OpenGL_state(jet_context_OpenGL *this)
{
  _BYTE v2[16];

  glContextUse::glContextUse((glContextUse *)v2, *((EAGLContext **)this + 13));
  glGetError();
  glBindFramebuffer(0x8D40u, *((_DWORD *)this + 46));
  glEnable(0xC11u);
  jet_context_OpenGL::set_blend_mode((uint64_t)this, *((_DWORD *)this + 47), 0);
  (*(void (**)(jet_context_OpenGL *, _QWORD))(*(_QWORD *)this + 192))(this, *((_QWORD *)this + 21));
  glContextUse::~glContextUse((glContextUse *)v2);
}

void sub_2144D1F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_framebuffer_from_OpenGL_Framebuffer(id *this, int a2)
{
  uint64_t v4;

  v4 = operator new();
  jet_framebuffer_OpenGL::jet_framebuffer_OpenGL((jet_framebuffer_OpenGL *)v4);
  objc_storeStrong((id *)(v4 + 256), this[13]);
  *(_DWORD *)(v4 + 264) = a2;
  return v4;
}

void sub_2144D1FE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C4023D4BD15);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_texture_from_CIImage(jet_context_OpenGL *this, CIImage *a2)
{
  CIImage *v3;
  double v4;
  double v5;
  uint64_t texture_2d;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v3 = a2;
  -[CIImage extent](v3, "extent");
  texture_2d = jet_context::create_texture_2d((uint64_t)this, v4, v5, 3, 0, 0, 0);
  (*(void (**)(uint64_t *__return_ptr, jet_context_OpenGL *, CIImage *, uint64_t, __n128))(*(_QWORD *)this
                                                                                                  + 160))(&v11, this, v3, texture_2d, (__n128)0);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return texture_2d;
}

void sub_2144D20C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id jet_context_OpenGL::get_OpenGL_Context(id *this)
{
  return this[13];
}

void glContextUse::glContextUse(glContextUse *this, EAGLContext *a2)
{
  EAGLContext *v3;
  EAGLContext *v4;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  *(_QWORD *)this = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  *((_QWORD *)this + 1) = v4;
  if (*(EAGLContext **)this != v4)
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v4);

}

void sub_2144D2148(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;

  _Unwind_Resume(a1);
}

void glContextUse::~glContextUse(glContextUse *this)
{
  void *v2;

  v2 = *(void **)this;
  if (*(_QWORD *)this != *((_QWORD *)this + 1))
  {
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:");
    v2 = (void *)*((_QWORD *)this + 1);
  }

}

uint64_t jet_buffer_OpenGL::jet_buffer_OpenGL(uint64_t a1, void *a2, int a3, int a4, int a5, const GLvoid *a6)
{
  id v11;
  EAGLContext *v12;
  int v13;
  GLuint v14;
  GLsizeiptr v15;
  GLenum v16;
  GLuint buffers;
  _BYTE v19[16];

  v11 = a2;
  jet_buffer::jet_buffer((jet_buffer *)a1);
  *(_QWORD *)a1 = &off_24D1A3B60;
  v12 = (EAGLContext *)v11;
  *(_QWORD *)(a1 + 96) = v12;
  *(_DWORD *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  glContextUse::glContextUse((glContextUse *)v19, v12);
  if ((a3 - 1) > 7)
    v13 = 4;
  else
    v13 = dword_2144DDF78[a3 - 1];
  buffers = 0;
  glGenBuffers(1, &buffers);
  v14 = buffers;
  *(_DWORD *)(a1 + 40) = a3;
  *(_DWORD *)(a1 + 44) = a4;
  *(_DWORD *)(a1 + 48) = a5;
  v15 = (a5 * a4 * v13);
  *(_DWORD *)(a1 + 104) = v14;
  *(_DWORD *)(a1 + 108) = v15;
  if (a6)
  {
    if (a4 == 1 && (a3 - 2) <= 2)
    {
      v16 = 34963;
      glBindBuffer(0x8893u, v14);
    }
    else
    {
      v16 = 34962;
      glBindBuffer(0x8892u, v14);
    }
    glBufferData(v16, v15, a6, 0x88E0u);
    *(_BYTE *)(a1 + 112) = 1;
  }
  glContextUse::~glContextUse((glContextUse *)v19);

  return a1;
}

void sub_2144D22F0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  jet_buffer::~jet_buffer((dispatch_semaphore_t *)v1);
  _Unwind_Resume(a1);
}

uint64_t jet_buffer_OpenGL::get_length(jet_buffer_OpenGL *this)
{
  return *((unsigned int *)this + 27);
}

_DWORD *jet_buffer_OpenGL::set_data(_DWORD *this, const void *a2, unsigned int a3, uint64_t a4)
{
  _DWORD *v5;
  unsigned int v6;
  size_t v7;
  uint64_t v9;

  if (a2)
  {
    v5 = this;
    v6 = this[27];
    if (a3)
      v7 = a3;
    else
      v7 = v6;
    if ((int)v7 + (int)a4 > v6)
      jet_buffer_OpenGL::set_data();
    v9 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)this + 16))(this);
    memcpy((void *)(v9 + a4), a2, v7);
    return (_DWORD *)(*(uint64_t (**)(_DWORD *, size_t, uint64_t))(*(_QWORD *)v5 + 24))(v5, v7, a4);
  }
  return this;
}

void *jet_buffer_OpenGL::get_data(jet_buffer_OpenGL *this)
{
  void *result;
  unsigned int v3;

  result = (void *)*((_QWORD *)this + 15);
  if (!result)
  {
    v3 = (**(uint64_t (***)(jet_buffer_OpenGL *))this)(this);
    result = malloc_type_malloc(v3, 0xA39FA485uLL);
    *((_QWORD *)this + 15) = result;
  }
  return result;
}

void jet_buffer_OpenGL::commit_data(jet_buffer_OpenGL *this, unsigned int a2, int a3)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char *v9;
  GLenum v10;
  GLsizeiptr v11;
  void *v12;
  _BYTE v13[16];

  v6 = (*(uint64_t (**)(jet_buffer_OpenGL *))(*(_QWORD *)this + 16))(this);
  v7 = *((_DWORD *)this + 27);
  if (a2)
    v8 = a2;
  else
    v8 = v7;
  if ((int)v8 + a3 > v7)
    jet_buffer_OpenGL::commit_data();
  v9 = (char *)v6;
  glContextUse::glContextUse((glContextUse *)v13, *((EAGLContext **)this + 12));
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 2)
    v10 = 34963;
  else
    v10 = 34962;
  glBindBuffer(v10, *((_DWORD *)this + 26));
  if (!*((_BYTE *)this + 112))
  {
    *((_BYTE *)this + 112) = 1;
    v11 = *((unsigned int *)this + 27);
    if (!a3 && (_DWORD)v8 == (_DWORD)v11)
    {
      glBufferData(v10, v8, v9, 0x88E8u);
      goto LABEL_18;
    }
    glBufferData(v10, v11, 0, 0x88E8u);
  }
  if (a3 || (_DWORD)v8 != *((_DWORD *)this + 27))
  {
    v12 = (void *)glMapBufferRangeEXT();
    memcpy(v12, &v9[a3], v8);
    glUnmapBufferOES();
  }
  else
  {
    glBufferData(v10, v8, v9, 0x88E8u);
  }
  glBindBuffer(v10, 0);
LABEL_18:
  glContextUse::~glContextUse((glContextUse *)v13);
}

void sub_2144D254C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

void jet_buffer_OpenGL::resize(jet_buffer_OpenGL *this, int a2)
{
  unsigned int v4;
  int v5;
  size_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  size_t v10;

  v4 = *((_DWORD *)this + 10) - 1;
  if (v4 > 7)
    v5 = 4;
  else
    v5 = dword_2144DDF78[v4];
  v6 = (v5 * a2 * *((_DWORD *)this + 11));
  if (*((_QWORD *)this + 15))
  {
    v7 = malloc_type_malloc(v6, 0x35DE276AuLL);
    v8 = v7;
    v9 = *((_DWORD *)this + 27);
    if (v6 >= v9)
      v10 = v9;
    else
      v10 = v6;
    memcpy(v7, *((const void **)this + 15), v10);
    free(*((void **)this + 15));
    *((_QWORD *)this + 15) = v8;
  }
  *((_BYTE *)this + 112) = 0;
  *((_DWORD *)this + 27) = v6;
  *((_DWORD *)this + 12) = a2;
}

void jet_buffer_OpenGL::~jet_buffer_OpenGL(jet_buffer_OpenGL *this)
{
  jet_buffer_OpenGL::~jet_buffer_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  EAGLContext *v2;
  void *v3;
  GLuint buffers;
  _BYTE v5[16];

  *(_QWORD *)this = &off_24D1A3B60;
  v2 = (EAGLContext *)*((_QWORD *)this + 12);
  if (v2 && *((_DWORD *)this + 26))
  {
    glContextUse::glContextUse((glContextUse *)v5, v2);
    buffers = *((_DWORD *)this + 26);
    glDeleteBuffers(1, &buffers);
    *((_DWORD *)this + 26) = 0;
    glContextUse::~glContextUse((glContextUse *)v5);
  }
  v3 = (void *)*((_QWORD *)this + 15);
  if (v3)
    free(v3);

  jet_buffer::~jet_buffer((dispatch_semaphore_t *)this);
}

uint64_t jet_buffer_OpenGL::set_value(jet_buffer_OpenGL *this, float a2)
{
  float v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_buffer_OpenGL *, float *, uint64_t, _QWORD))(*(_QWORD *)this + 8))(this, &v3, 4, 0);
}

uint64_t jet_buffer_OpenGL::set_value(uint64_t a1, double a2)
{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 8, 0);
}

uint64_t jet_buffer_OpenGL::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 16, 0);
}

{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 16, 0);
}

uint64_t jet_buffer_OpenGL::set_value(jet_buffer_OpenGL *this, __int16 a2)
{
  __int16 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_buffer_OpenGL *, __int16 *, uint64_t, _QWORD))(*(_QWORD *)this + 8))(this, &v3, 2, 0);
}

uint64_t jet_buffer_OpenGL::set_value(uint64_t a1, int a2)
{
  int v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 4, 0);
}

jet_buffer_pool *jet_buffer_pool_OpenGL::jet_buffer_pool_OpenGL(jet_buffer_pool *a1, void *a2, int a3, int a4, int a5)
{
  id v9;
  id v10;

  v9 = a2;
  jet_buffer_pool::jet_buffer_pool((uint64_t)a1, a3, a4, a5);
  *(_QWORD *)a1 = &off_24D1A3C00;
  v10 = v9;
  *((_QWORD *)a1 + 8) = v10;
  jet_buffer_pool::initialize_first_buffer(a1);

  return a1;
}

void sub_2144D28D0(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)v2);
  _Unwind_Resume(a1);
}

void jet_buffer_pool_OpenGL::~jet_buffer_pool_OpenGL(id *this)
{

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);
}

{

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_buffer_pool_OpenGL::create_buffer(jet_buffer_pool_OpenGL *this)
{
  uint64_t v2;

  v2 = operator new();
  jet_buffer_OpenGL::jet_buffer_OpenGL(v2, *((void **)this + 8), *((_DWORD *)this + 2), *((_DWORD *)this + 3), *((_DWORD *)this + 4), 0);
  return v2;
}

void sub_2144D29AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C402150694FLL);
  _Unwind_Resume(a1);
}

uint64_t jet_constant_OpenGL::get_length(jet_constant_OpenGL *this)
{
  return *((unsigned int *)this + 5);
}

uint64_t jet_constant::get_type(jet_constant *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t jet_constant::get_components_per_element(jet_constant *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t jet_constant::get_element_count(jet_constant *this)
{
  return *((unsigned int *)this + 4);
}

void *jet_constant_OpenGL::set_data(void **this, const void *a2, size_t __n)
{
  return memcpy(this[3], a2, __n);
}

void *jet_constant_OpenGL::copy_data(const void **this, void *__dst, size_t __n)
{
  return memcpy(__dst, this[3], __n);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, float a2)
{
  float v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, float *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 4);
}

uint64_t jet_constant_OpenGL::set_value(uint64_t a1, double a2)
{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 8);
}

uint64_t jet_constant_OpenGL::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 16);
}

{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 16);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, simd_float2x2 a2)
{
  simd_float2x2 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, simd_float2x2 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 16);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, simd_float3x3 a2)
{
  simd_float3x3 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, simd_float3x3 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 48);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, simd_float4x4 a2)
{
  simd_float4x4 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, simd_float4x4 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 64);
}

void jet_constant_OpenGL::~jet_constant_OpenGL(jet_constant_OpenGL *this)
{
  jet_constant_OpenGL::~jet_constant_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;

  *(_QWORD *)this = off_24D1A3C48;
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    free(v2);
    *((_QWORD *)this + 3) = 0;
  }
  jet_constant::~jet_constant(this);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, __int16 a2)
{
  __int16 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, __int16 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 2);
}

uint64_t jet_constant_OpenGL::set_value(uint64_t a1, int a2)
{
  int v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 4);
}

void jet_texture_OpenGL::jet_texture_OpenGL(jet_texture_OpenGL *this, EAGLContext *a2)
{
  EAGLContext *v3;

  v3 = a2;
  jet_texture::jet_texture(this);
  *(_QWORD *)this = off_24D1A3D08;
  *((_QWORD *)this + 1) = v3;
  *(_WORD *)((char *)this + 45) = 256;
}

void sub_2144D2C90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t jet_texture_OpenGL::get_width(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 8);
}

uint64_t jet_texture_OpenGL::get_height(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 9);
}

uint64_t jet_texture_OpenGL::get_depth(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 10);
}

uint64_t jet_texture_OpenGL::get_type(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 7);
}

uint64_t jet_texture_OpenGL::get_format(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t jet_texture_OpenGL::get_mip_mapped(jet_texture_OpenGL *this)
{
  return *((unsigned __int8 *)this + 44);
}

uint64_t jet_texture_OpenGL::get_slice_count(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 12);
}

void jet_texture_OpenGL::set_data(EAGLContext **this, const void *a2, GLint a3, unsigned int a4, GLint a5)
{
  GLenum v10;
  int v11;
  GLint v12;
  int v13;
  GLsizei v14;
  GLsizei v15;
  int v16;
  GLenum v17;
  GLenum v18;
  GLenum v19;
  _BYTE v20[16];

  if (((unsigned int (*)(EAGLContext **))(*this)[5]._private)(this))
    jet_texture_OpenGL::set_data();
  glContextUse::glContextUse((glContextUse *)v20, this[1]);
  if (*((_DWORD *)this + 7) == 2)
    v10 = 34067;
  else
    v10 = 3553;
  glBindTexture(v10, *((_DWORD *)this + 4));
  if (a5)
    glPixelStorei(0xCF2u, a5);
  glPixelStorei(0xCF5u, 1);
  if (*((_DWORD *)this + 7) == 2)
  {
    if (a4 >= 6)
      __assert_rtn("set_data", "jet_types_OpenGL.h", 381, "slice_index <= 5");
    v11 = *((_DWORD *)this + 6) - 1;
    if (v11 > 0xC)
      v12 = 0;
    else
      v12 = dword_2144DDF98[v11];
    v14 = ((uint64_t (*)(EAGLContext **))(*this)->super.isa)(this);
    v15 = ((uint64_t (*)(EAGLContext **))(*this)->_private)(this);
    v18 = a4 + 34069;
    v16 = *((_DWORD *)this + 6);
    v17 = 6403;
    switch(v16)
    {
      case 1:
        break;
      case 2:
        goto LABEL_22;
      case 3:
      case 5:
      case 10:
        goto LABEL_17;
      case 4:
      case 6:
        goto LABEL_19;
      case 11:
        goto LABEL_23;
      case 12:
        goto LABEL_20;
      case 13:
        goto LABEL_21;
      default:
        goto LABEL_18;
    }
  }
  else
  {
    v13 = *((_DWORD *)this + 6) - 1;
    if (v13 > 0xC)
      v12 = 0;
    else
      v12 = dword_2144DDF98[v13];
    v14 = ((uint64_t (*)(EAGLContext **))(*this)->super.isa)(this);
    v15 = ((uint64_t (*)(EAGLContext **))(*this)->_private)(this);
    v16 = *((_DWORD *)this + 6);
    v17 = 6403;
    v18 = 3553;
    switch(v16)
    {
      case 1:
        break;
      case 2:
LABEL_22:
        v17 = 33319;
        break;
      case 3:
      case 5:
      case 10:
LABEL_17:
        v17 = 6408;
        break;
      case 4:
      case 6:
LABEL_19:
        v17 = 32993;
        break;
      case 7:
      case 8:
      case 9:
LABEL_18:
        v17 = 0;
        break;
      case 11:
LABEL_23:
        v17 = 35056;
        break;
      case 12:
LABEL_20:
        v17 = 36168;
        break;
      case 13:
LABEL_21:
        v17 = 33189;
        break;
      default:
        v17 = 0;
        v18 = 3553;
        break;
    }
  }
  if (v16 == 10)
    v19 = 5126;
  else
    v19 = 5121;
  glTexImage2D(v18, a3, v12, v14, v15, 0, v17, v19, a2);
  if (a5)
    glPixelStorei(0xCF2u, 0);
  glContextUse::~glContextUse((glContextUse *)v20);
}

void sub_2144D2F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

void jet_texture_OpenGL::replace_region(EAGLContext **this, const void *a2, unsigned int a3, unsigned int a4, GLint a5, GLint a6, unsigned int a7, GLsizei a8, GLsizei height, unsigned int a10, GLint param, unsigned int a12)
{
  GLenum v18;
  GLenum v19;
  int v20;
  GLenum v21;
  GLenum v22;
  _BYTE v23[16];

  if (((unsigned int (*)(EAGLContext **))(*this)[5]._private)(this))
    jet_texture_OpenGL::replace_region();
  glContextUse::glContextUse((glContextUse *)v23, this[1]);
  if (*((_DWORD *)this + 7) == 2)
    v18 = 34067;
  else
    v18 = 3553;
  glBindTexture(v18, *((_DWORD *)this + 4));
  if (param)
    glPixelStorei(0xCF2u, param);
  glPixelStorei(0xCF5u, 1);
  if (*((_DWORD *)this + 7) == 2)
  {
    if (a4 >= 6)
      __assert_rtn("replace_region", "jet_types_OpenGL.h", 431, "slice_index <= 5");
    v19 = a4 + 34069;
    v20 = *((_DWORD *)this + 6);
    v21 = 6403;
    switch(v20)
    {
      case 1:
        break;
      case 2:
        v21 = 33319;
        break;
      case 3:
      case 5:
      case 10:
        v21 = 6408;
        break;
      case 4:
      case 6:
        v21 = 32993;
        break;
      case 11:
        v21 = 35056;
        break;
      case 12:
        v21 = 36168;
        break;
      case 13:
        v21 = 33189;
        break;
      default:
        v21 = 0;
        break;
    }
  }
  else
  {
    v20 = *((_DWORD *)this + 6);
    if ((v20 - 1) > 0xC)
      v21 = 0;
    else
      v21 = dword_2144DDFCC[v20 - 1];
    v19 = 3553;
  }
  if (v20 == 10)
    v22 = 5126;
  else
    v22 = 5121;
  glTexSubImage2D(v19, 0, a5, a6, a8, height, v21, v22, a2);
  if (param)
    glPixelStorei(0xCF2u, 0);
  glContextUse::~glContextUse((glContextUse *)v23);
}

void sub_2144D3100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

void jet_texture_OpenGL::copy_data(jet_texture_OpenGL *this, void *a2, GLint a3, unsigned int a4)
{
  GLuint v8;
  GLenum v9;
  GLenum v10;
  int v11;
  GLenum v12;
  GLenum v13;
  GLint params[2];
  _BYTE v15[16];

  glContextUse::glContextUse((glContextUse *)v15, *((EAGLContext **)this + 1));
  *(_QWORD *)params = 0;
  glGetIntegerv(0x8CA6u, &params[1]);
  glGenFramebuffers(1, (GLuint *)params);
  glBindFramebuffer(0x8D40u, params[0]);
  v8 = *((_DWORD *)this + 5);
  if (v8)
  {
    glBindRenderbuffer(0x8D41u, v8);
    glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *((_DWORD *)this + 5));
  }
  else
  {
    if (*((_DWORD *)this + 7) == 2)
      v9 = 34067;
    else
      v9 = 3553;
    glBindTexture(v9, *((_DWORD *)this + 4));
    if (*((_DWORD *)this + 7) == 2)
    {
      if (a4 >= 6)
        abort();
      v10 = a4 + 34069;
    }
    else
    {
      v10 = 3553;
    }
    glFramebufferTexture2D(0x8D40u, 0x8CE0u, v10, *((_DWORD *)this + 4), a3);
  }
  glPixelStorei(0xCF5u, 1);
  v11 = *((_DWORD *)this + 6);
  if ((v11 - 1) > 0xC)
    v12 = 0;
  else
    v12 = dword_2144DDFCC[v11 - 1];
  if (v11 == 10)
    v13 = 5126;
  else
    v13 = 5121;
  glReadPixels(0, 0, *((_DWORD *)this + 8), *((_DWORD *)this + 9), v12, v13, a2);
  glBindFramebuffer(0x8D40u, params[1]);
  glDeleteFramebuffers(1, (const GLuint *)params);
  glContextUse::~glContextUse((glContextUse *)v15);
}

void sub_2144D3278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

BOOL jet_texture_OpenGL::generate_mip_map(EAGLContext **this)
{
  unsigned int v2;
  unsigned int v3;
  _BOOL8 isPOT;
  GLenum v5;
  GLenum v6;
  _BYTE v8[16];

  v2 = ((uint64_t (*)(EAGLContext **))(*this)->super.isa)(this);
  v3 = ((uint64_t (*)(EAGLContext **))(*this)->_private)(this);
  isPOT = jet_util_isPOT(v2, v3);
  if (isPOT)
  {
    glContextUse::glContextUse((glContextUse *)v8, this[1]);
    if (*((_DWORD *)this + 7) == 2)
      v5 = 34067;
    else
      v5 = 3553;
    glBindTexture(v5, *((_DWORD *)this + 4));
    if (*((_DWORD *)this + 7) == 2)
      v6 = 34067;
    else
      v6 = 3553;
    glGenerateMipmap(v6);
    glContextUse::~glContextUse((glContextUse *)v8);
  }
  return isPOT;
}

void sub_2144D3330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_texture_OpenGL::is_color_attachment_compatible(jet_texture_OpenGL *this)
{
  if (*((_BYTE *)this + 45))
    return 0;
  else
    return jet_texture::is_color_attachment_compatible(this);
}

BOOL jet_texture_OpenGL::is_depth_attachment_compatible(jet_texture_OpenGL *this)
{
  return !*((_BYTE *)this + 45) && jet_texture::is_depth_attachment_compatible(this);
}

BOOL jet_texture_OpenGL::is_stencil_attachment_compatible(jet_texture_OpenGL *this)
{
  return !*((_BYTE *)this + 45) && jet_texture::is_stencil_attachment_compatible(this);
}

void jet_texture_OpenGL::~jet_texture_OpenGL(jet_texture_OpenGL *this)
{
  jet_texture_OpenGL::~jet_texture_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  EAGLContext *v2;
  _BYTE v3[16];

  *(_QWORD *)this = off_24D1A3D08;
  v2 = (EAGLContext *)*((_QWORD *)this + 1);
  if (v2 && *((_BYTE *)this + 46))
  {
    glContextUse::glContextUse((glContextUse *)v3, v2);
    if (*((_DWORD *)this + 4))
    {
      glDeleteTextures(1, (const GLuint *)this + 4);
      *((_DWORD *)this + 4) = 0;
    }
    if (*((_DWORD *)this + 5))
    {
      glDeleteRenderbuffers(1, (const GLuint *)this + 5);
      *((_DWORD *)this + 5) = 0;
    }
    glContextUse::~glContextUse((glContextUse *)v3);
    v2 = (EAGLContext *)*((_QWORD *)this + 1);
  }

  jet_texture::~jet_texture(this);
}

void jet_sampler_OpenGL::~jet_sampler_OpenGL(jet_sampler_OpenGL *this)
{
  jet_sampler::~jet_sampler(this);
  JUMPOUT(0x2199CF8ACLL);
}

void jet_function_OpenGL::~jet_function_OpenGL(jet_function_OpenGL *this)
{
  jet_function_OpenGL::~jet_function_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  EAGLContext *v2;
  _BYTE v3[16];

  *(_QWORD *)this = &off_24D1A3DD8;
  v2 = (EAGLContext *)*((_QWORD *)this + 1);
  if (v2 && *((_DWORD *)this + 4))
  {
    glContextUse::glContextUse((glContextUse *)v3, v2);
    glDeleteShader(*((_DWORD *)this + 4));
    *((_DWORD *)this + 4) = 0;
    glContextUse::~glContextUse((glContextUse *)v3);
    v2 = (EAGLContext *)*((_QWORD *)this + 1);
  }

}

void jet_program_OpenGL::jet_program_OpenGL(jet_program_OpenGL *this, EAGLContext *a2, xglProgram *a3)
{
  EAGLContext *v5;

  v5 = a2;
  jet_program::jet_program(this);
  *(_QWORD *)this = &off_24D1A3E20;
  *((_QWORD *)this + 4) = v5;
  *((_QWORD *)this + 5) = a3;
}

void sub_2144D354C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void jet_program_OpenGL::~jet_program_OpenGL(jet_program_OpenGL *this)
{
  jet_program_OpenGL::~jet_program_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  xglProgram *v2;

  *(_QWORD *)this = &off_24D1A3E20;
  v2 = (xglProgram *)*((_QWORD *)this + 5);
  if (v2)
  {
    xglProgram::~xglProgram(v2);
    MEMORY[0x2199CF8AC]();
  }

  jet_program::~jet_program(this);
}

void jet_render_mode_OpenGL::~jet_render_mode_OpenGL(jet_render_mode_OpenGL *this)
{
  *(_QWORD *)this = &off_24D1A3E58;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 1;

  jet_render_mode::~jet_render_mode(this);
}

{
  *(_QWORD *)this = &off_24D1A3E58;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 1;

  jet_render_mode::~jet_render_mode(this);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_render_mode_OpenGL::get_vertex_buffer_index(uint64_t a1, char *a2)
{
  char *v4;
  uint64_t AttributeIndex;
  _BYTE v7[16];

  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0)
    v4 = a2;
  else
    v4 = *(char **)a2;
  AttributeIndex = xglProgram::getAttributeIndex(*(xglProgram **)(*(_QWORD *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return AttributeIndex;
}

void sub_2144D36C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_render_mode_OpenGL::get_vertex_constant_index(uint64_t a1, char *a2)
{
  char *v4;
  uint64_t UniformLocation;
  _BYTE v7[16];

  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0)
    v4 = a2;
  else
    v4 = *(char **)a2;
  UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(_QWORD *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_2144D3738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_render_mode_OpenGL::get_vertex_texture_index(uint64_t a1, char *a2)
{
  char *v4;
  uint64_t UniformLocation;
  _BYTE v7[16];

  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0)
    v4 = a2;
  else
    v4 = *(char **)a2;
  UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(_QWORD *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_2144D37AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_render_mode_OpenGL::get_vertex_sampler_index(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
}

uint64_t jet_render_mode_OpenGL::get_fragment_constant_index(uint64_t a1, char *a2)
{
  char *v4;
  uint64_t UniformLocation;
  _BYTE v7[16];

  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0)
    v4 = a2;
  else
    v4 = *(char **)a2;
  UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(_QWORD *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_2144D382C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_render_mode_OpenGL::get_fragment_texture_index(uint64_t a1, char *a2)
{
  char *v4;
  uint64_t UniformLocation;
  _BYTE v7[16];

  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0)
    v4 = a2;
  else
    v4 = *(char **)a2;
  UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(_QWORD *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_2144D38A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

uint64_t jet_render_mode_OpenGL::get_fragment_sampler_index(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
}

uint64_t jet_render_mode_OpenGL::clone(jet_render_mode_OpenGL *this)
{
  uint64_t v2;

  v2 = operator new();
  *(_OWORD *)(v2 + 8) = *(_OWORD *)((char *)this + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)((char *)this + 24);
  *(_QWORD *)v2 = &off_24D1A3E58;
  *(_QWORD *)(v2 + 40) = *((id *)this + 5);
  return v2;
}

void jet_stencil_mode_OpenGL::~jet_stencil_mode_OpenGL(jet_stencil_mode_OpenGL *this)
{
  jet_stencil_mode::~jet_stencil_mode(this);
  JUMPOUT(0x2199CF8ACLL);
}

void jet_depth_stencil_mode_OpenGL::~jet_depth_stencil_mode_OpenGL(jet_depth_stencil_mode_OpenGL *this)
{
  jet_depth_stencil_mode_OpenGL::~jet_depth_stencil_mode_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_24D1A3F08;
  v2 = *((_QWORD *)this + 2);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 3);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  jet_depth_stencil_mode::~jet_depth_stencil_mode(this);
}

BOOL jet_fence_OpenGL::is_finished(jet_fence_OpenGL *this)
{
  int v2;
  _BOOL8 v3;
  _BYTE v5[16];

  if (!*((_QWORD *)this + 2))
    return 1;
  glContextUse::glContextUse((glContextUse *)v5, *((EAGLContext **)this + 1));
  v2 = (glClientWaitSyncAPPLE() - 37146) & 0xFFFFFFFD;
  v3 = v2 == 0;
  if (!v2)
  {
    glDeleteSyncAPPLE();
    *((_QWORD *)this + 2) = 0;
  }
  glContextUse::~glContextUse((glContextUse *)v5);
  return v3;
}

void sub_2144D3A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

BOOL jet_fence_OpenGL::wait(jet_fence_OpenGL *this)
{
  int v2;
  _BOOL8 v3;
  _BYTE v5[16];

  if (!*((_QWORD *)this + 2))
    return 1;
  glContextUse::glContextUse((glContextUse *)v5, *((EAGLContext **)this + 1));
  v2 = (glClientWaitSyncAPPLE() - 37146) & 0xFFFFFFFD;
  v3 = v2 == 0;
  if (!v2)
  {
    glDeleteSyncAPPLE();
    *((_QWORD *)this + 2) = 0;
  }
  glContextUse::~glContextUse((glContextUse *)v5);
  return v3;
}

void sub_2144D3B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

void jet_fence_OpenGL::~jet_fence_OpenGL(jet_fence_OpenGL *this)
{
  jet_fence_OpenGL::~jet_fence_OpenGL(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  EAGLContext *v2;
  _BYTE v3[16];

  *(_QWORD *)this = off_24D1A3F40;
  v2 = (EAGLContext *)*((_QWORD *)this + 1);
  if (v2 && *((_QWORD *)this + 2))
  {
    glContextUse::glContextUse((glContextUse *)v3, v2);
    glDeleteSyncAPPLE();
    *((_QWORD *)this + 2) = 0;
    glContextUse::~glContextUse((glContextUse *)v3);
    v2 = (EAGLContext *)*((_QWORD *)this + 1);
  }

  jet_fence::~jet_fence(this);
}

void jet_framebuffer_OpenGL::jet_framebuffer_OpenGL(jet_framebuffer_OpenGL *this)
{
  *((_DWORD *)this + 54) = 1065353216;
  *(_QWORD *)((char *)this + 220) = 0x100000001;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 30) = 0x100000000;
  *((_DWORD *)this + 62) = 1;
  *((_QWORD *)this + 2) = 0;
  *((_OWORD *)this + 2) = xmmword_2144DDBB0;
  *((_QWORD *)this + 6) = 1;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_OWORD *)this + 5) = xmmword_2144DDBB0;
  *((_DWORD *)this + 24) = 1;
  *(_QWORD *)((char *)this + 100) = 0;
  *(_QWORD *)((char *)this + 116) = 0;
  *(_QWORD *)((char *)this + 108) = 0;
  *((_DWORD *)this + 31) = 0;
  *((_OWORD *)this + 8) = xmmword_2144DDBB0;
  *((_DWORD *)this + 36) = 1;
  *(_QWORD *)((char *)this + 156) = 0;
  *(_QWORD *)((char *)this + 148) = 0;
  *((_DWORD *)this + 43) = 0;
  *(_QWORD *)((char *)this + 164) = 0;
  *((_OWORD *)this + 11) = xmmword_2144DDBB0;
  *((_QWORD *)this + 24) = 1;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  *(_QWORD *)this = &off_24D1A3F88;
  *((_QWORD *)this + 32) = 0;
  *((_DWORD *)this + 66) = -1;
}

void jet_framebuffer_OpenGL::~jet_framebuffer_OpenGL(id *this)
{

}

{

  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_framebuffer_OpenGL::clone(jet_framebuffer_OpenGL *this)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = operator new();
  v3 = *((_OWORD *)this + 14);
  *(_OWORD *)(v2 + 208) = *((_OWORD *)this + 13);
  *(_OWORD *)(v2 + 224) = v3;
  *(_OWORD *)(v2 + 240) = *((_OWORD *)this + 15);
  v4 = *((_OWORD *)this + 10);
  *(_OWORD *)(v2 + 144) = *((_OWORD *)this + 9);
  *(_OWORD *)(v2 + 160) = v4;
  v5 = *((_OWORD *)this + 12);
  *(_OWORD *)(v2 + 176) = *((_OWORD *)this + 11);
  *(_OWORD *)(v2 + 192) = v5;
  v6 = *((_OWORD *)this + 6);
  *(_OWORD *)(v2 + 80) = *((_OWORD *)this + 5);
  *(_OWORD *)(v2 + 96) = v6;
  v7 = *((_OWORD *)this + 8);
  *(_OWORD *)(v2 + 112) = *((_OWORD *)this + 7);
  *(_OWORD *)(v2 + 128) = v7;
  v8 = *((_OWORD *)this + 2);
  *(_OWORD *)(v2 + 16) = *((_OWORD *)this + 1);
  *(_OWORD *)(v2 + 32) = v8;
  v9 = *((_OWORD *)this + 4);
  *(_OWORD *)(v2 + 48) = *((_OWORD *)this + 3);
  *(_OWORD *)(v2 + 64) = v9;
  *(_QWORD *)v2 = &off_24D1A3F88;
  *(_QWORD *)(v2 + 256) = *((id *)this + 32);
  *(_DWORD *)(v2 + 264) = *((_DWORD *)this + 66);
  return v2;
}

void std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t **std::__tree<std::__value_type<unsigned int,jet_sampler *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,jet_sampler *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,jet_sampler *>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 5) = 0;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

_QWORD *std::shared_ptr<jet_fence_OpenGL>::shared_ptr[abi:ne180100]<jet_fence_OpenGL,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24D1A3FB0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2144D3F68(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<jet_fence_OpenGL *,std::shared_ptr<jet_fence_OpenGL>::__shared_ptr_default_delete<jet_fence_OpenGL,jet_fence_OpenGL>,std::allocator<jet_fence_OpenGL>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t std::__shared_ptr_pointer<jet_fence_OpenGL *,std::shared_ptr<jet_fence_OpenGL>::__shared_ptr_default_delete<jet_fence_OpenGL,jet_fence_OpenGL>,std::allocator<jet_fence_OpenGL>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<jet_fence_OpenGL *,std::shared_ptr<jet_fence_OpenGL>::__shared_ptr_default_delete<jet_fence_OpenGL,jet_fence_OpenGL>,std::allocator<jet_fence_OpenGL>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t jet_context_Metal::jet_context_Metal(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  jet_context::jet_context((jet_context *)a1);
  *(_QWORD *)a1 = &off_24D1A4028;
  v4 = v3;
  v5 = 0;
  *(_QWORD *)(a1 + 104) = v4;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_QWORD *)(a1 + 144) = 0;
  if (!v4)
  {
    jet_choose_Metal_Device();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v6;

    v5 = *(void **)(a1 + 112);
  }
  *(_QWORD *)(a1 + 112) = 0;

  v8 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 120) = 0;

  v9 = *(void **)(a1 + 128);
  *(_QWORD *)(a1 + 128) = 0;

  v10 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = 0;

  *(_QWORD *)(a1 + 16) = 0;
  return a1;
}

void sub_2144D4104(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  jet_context::~jet_context((jet_context *)v1);
  _Unwind_Resume(a1);
}

void jet_context_Metal::~jet_context_Metal(id *this)
{

  jet_context::~jet_context((jet_context *)this);
}

{
  jet_context_Metal::~jet_context_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_context_Metal::get_context_type(jet_context_Metal *this)
{
  return 1;
}

uint64_t jet_context_Metal::create_buffer(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  uint64_t v10;

  v10 = operator new();
  jet_buffer_Metal::jet_buffer_Metal(v10, *(void **)(a1 + 104), a2, a3, a4, a5);
  return v10;
}

void sub_2144D424C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C405BB150DBLL);
  _Unwind_Resume(a1);
}

jet_buffer_pool *jet_context_Metal::create_buffer_pool(uint64_t a1, int a2, int a3, int a4)
{
  jet_buffer_pool *v8;

  v8 = (jet_buffer_pool *)operator new();
  jet_buffer_pool_Metal::jet_buffer_pool_Metal(v8, *(void **)(a1 + 104), a2, a3, a4);
  return v8;
}

void sub_2144D42DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C40EB43BACFLL);
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_constant(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((a2 - 1) > 7)
    v8 = 4;
  else
    v8 = dword_2144DE320[a2 - 1];
  v9 = a4 * a3;
  v10 = (a4 * a3 * v8);
  v11 = *(void **)(a1 + 104);
  if (a5)
    v12 = objc_msgSend(v11, "newBufferWithBytes:length:options:", a5, v10, 0);
  else
    v12 = objc_msgSend(v11, "newBufferWithLength:options:", (v9 * v8), 0);
  v13 = v12;
  v14 = operator new();
  jet_constant::jet_constant((jet_constant *)v14);
  *(_QWORD *)v14 = off_24D1A4388;
  *(_QWORD *)(v14 + 24) = v13;
  *(_DWORD *)(v14 + 8) = a2;
  *(_DWORD *)(v14 + 12) = a3;
  *(_DWORD *)(v14 + 16) = a4;
  return v14;
}

void sub_2144D43C0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x2199CF8AC](v2, 0x1081C40D47BEB4BLL);

  _Unwind_Resume(a1);
}

jet_framebuffer_Metal *jet_context_Metal::create_framebuffer_from_Metal_Encoder(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  jet_framebuffer_Metal *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a2;
  v5 = a3;
  v6 = (jet_framebuffer_Metal *)operator new();
  jet_framebuffer_Metal::jet_framebuffer_Metal(v6);
  v7 = (void *)*((_QWORD *)v6 + 32);
  *((_QWORD *)v6 + 32) = v4;
  v8 = v4;

  v9 = (void *)*((_QWORD *)v6 + 33);
  *((_QWORD *)v6 + 33) = v5;

  return v6;
}

void sub_2144D446C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x2199CF8AC](v3, 0x10A1C40F8985CBBLL);

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_texture(uint64_t a1, unsigned int a2, int a3, unsigned int a4, unsigned int a5, int a6, int a7, int a8, char a9, uint64_t a10)
{
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (a6 != 1)
    jet_context_Metal::create_texture();
  if (a8 != 1)
    jet_context_Metal::create_texture();
  if (a3 == 11)
  {
    if (a7)
      jet_context_Metal::create_texture();
    if (a10)
      jet_context_Metal::create_texture();
    if (a2 >= 2)
      jet_context_Metal::create_texture();
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 260, a4, a5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pixelFormat");
    objc_msgSend(v12, "setStorageMode:", 0);
    objc_msgSend(v12, "setUsage:", a9 & 7);
    v13 = (void *)objc_msgSend(*(id *)(a1 + 104), "newTextureWithDescriptor:", v12);
    if (v13)
    {
      v14 = operator new();
      jet_texture::jet_texture((jet_texture *)v14);
      *(_QWORD *)v14 = off_24D1A4470;
      *(_OWORD *)(v14 + 24) = 0u;
      *(_BYTE *)(v14 + 40) = 0;
      *(_OWORD *)(v14 + 8) = 0u;
      objc_storeStrong((id *)(v14 + 8), v13);
      objc_storeStrong((id *)(v14 + 16), v13);
      *(_DWORD *)(v14 + 32) = 11;
      *(_DWORD *)(v14 + 44) = 1;
      goto LABEL_17;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  if (a2 == 2)
  {
    if (a4 != a5)
      __assert_rtn("create_texture", "jet_context_Metal.mm", 614, "width == height");
    objc_msgSend(MEMORY[0x24BDDD740], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", getMetalPixelFormat(a3), a4, a7 != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", getMetalPixelFormat(a3), a4, a5, a7 != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v15;
  objc_msgSend(v15, "pixelFormat");
  objc_msgSend(v12, "setStorageMode:", 0);
  objc_msgSend(v12, "setUsage:", a9 & 7);
  v13 = (void *)objc_msgSend(*(id *)(a1 + 104), "newTextureWithDescriptor:", v12);
  if (!v13)
    goto LABEL_16;
  v14 = operator new();
  jet_texture::jet_texture((jet_texture *)v14);
  *(_QWORD *)v14 = off_24D1A4470;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_BYTE *)(v14 + 40) = 0;
  *(_OWORD *)(v14 + 8) = 0u;
  objc_storeStrong((id *)(v14 + 8), v13);
  v16 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = 0;

  *(_DWORD *)(v14 + 32) = a3;
  *(_DWORD *)(v14 + 44) = 1;
  if (a10)
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v14 + 56))(v14, a10, 0, 0, 0);
LABEL_17:

  return v14;
}

void sub_2144D4750(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x2199CF8AC](v3, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

uint64_t getMetalPixelFormat(int a1)
{
  if ((a1 - 1) > 0xD)
    return 0;
  else
    return *(_QWORD *)&asc_2144DE248[8 * a1 - 8];
}

uint64_t jet_context_Metal::create_texture_from_IOSurface(uint64_t a1, IOSurfaceID csid, unsigned int a3, unsigned int a4, int a5, unsigned int a6)
{
  __IOSurface *v11;
  uint64_t v12;
  char BytesPerRowOfPlane;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v11 = IOSurfaceLookup(csid);
  v12 = a6;
  BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v11, a6);
  if ((BytesPerRowOfPlane & 0xF) != 0)
    jet_context_Metal::create_texture_from_IOSurface();
  v14 = BytesPerRowOfPlane;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setWidth:", a3);
  objc_msgSend(v15, "setHeight:", a4);
  objc_msgSend(v15, "setPixelFormat:", getMetalPixelFormat(a5));
  objc_msgSend(v15, "setUsage:", 0);
  v16 = objc_msgSend(*(id *)(a1 + 104), "newTextureWithDescriptor:iosurface:plane:", v15, v11, v12);
  CFRelease(v11);
  v17 = operator new();
  jet_texture::jet_texture((jet_texture *)v17);
  *(_OWORD *)(v17 + 8) = 0u;
  *(_OWORD *)(v17 + 24) = 0u;
  *(_BYTE *)(v17 + 40) = 0;
  *(_QWORD *)v17 = off_24D1A4470;
  *(_QWORD *)(v17 + 8) = v16;
  *(_DWORD *)(v17 + 32) = a5;
  *(_DWORD *)(v17 + 44) = 1;
  *(_BYTE *)(v17 + 40) = (v14 & 0x1F) != 0;

  return v17;
}

void sub_2144D48F0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  MEMORY[0x2199CF8AC](v2, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

void jet_context_Metal::override_Metal_render_state(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  if (v14)
  {
    v8 = v14;
    v9 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = v8;
  }
  else
  {
    v10 = objc_msgSend(*(id *)(a1 + 104), "newCommandQueue");
    v11 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = v10;

    v12 = *(void **)(a1 + 120);
    jet_getClientLabel();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLabel:", v9);
  }

  jet_context_Metal::ensureCommandBuffer(a1, 1);
  v13 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v7;

  *(_QWORD *)(a1 + 16) = a4;
}

void sub_2144D49EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::ensureCommandBuffer(uint64_t this, int a2)
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(this + 128))
    v2 = a2 == 0;
  else
    v2 = 0;
  if (!v2)
  {
    v3 = this;
    objc_msgSend(*(id *)(this + 120), "commandBuffer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(v3 + 128);
    *(_QWORD *)(v3 + 128) = v4;

    return objc_msgSend(*(id *)(v3 + 128), "setLabel:", CFSTR("SpriteKit Render"));
  }
  return this;
}

id *jet_context_Metal::get_Metal_Texture(jet_context_Metal *this, jet_texture *lpsrc)
{
  id *v2;

  if (!lpsrc)
    return (id *)0;
  if (v2)
    v2 = (id *)v2[1];
  return v2;
}

id *jet_context_Metal::get_Metal_Drawable(jet_context_Metal *this, jet_texture *lpsrc)
{
  id *v2;

  if (!lpsrc)
    return (id *)0;
  if (v2)
    v2 = (id *)v2[3];
  return v2;
}

uint64_t jet_context_Metal::create_texture_from_Metal_Drawable(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "texture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = operator new();
  jet_texture::jet_texture((jet_texture *)v5);
  *(_QWORD *)v5 = off_24D1A4470;
  *(_BYTE *)(v5 + 40) = 0;
  *(_OWORD *)(v5 + 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  objc_storeStrong((id *)(v5 + 24), a2);
  objc_storeStrong((id *)(v5 + 8), v4);
  *(_DWORD *)(v5 + 32) = getJetTextureFormatFromMetalPixelFormat(objc_msgSend(v4, "pixelFormat"));
  *(_DWORD *)(v5 + 44) = objc_msgSend(v4, "arrayLength");

  return v5;
}

void sub_2144D4BBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x2199CF8AC](v3, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

uint64_t getJetTextureFormatFromMetalPixelFormat(uint64_t a1)
{
  uint64_t result;

  if (a1 > 252)
  {
    switch(a1)
    {
      case 550:
      case 551:
        return 9;
      case 552:
        return 7;
      case 553:
        return 8;
      case 554:
        return 5;
      case 555:
        return 14;
      default:
        if (a1 == 253)
        {
          result = 12;
        }
        else
        {
          if (a1 != 260)
            return 5;
          result = 11;
        }
        break;
    }
  }
  else if (a1 <= 79)
  {
    switch(a1)
    {
      case 10:
        return 1;
      case 30:
        return 2;
      case 70:
        return 3;
      default:
        return 5;
    }
  }
  else if (a1 > 114)
  {
    if (a1 != 115)
    {
      if (a1 == 252)
        return 13;
      return 5;
    }
    return 10;
  }
  else
  {
    if (a1 != 80)
    {
      if (a1 == 81)
        return 6;
      return 5;
    }
    return 4;
  }
  return result;
}

uint64_t jet_context_Metal::create_texture_from_Metal_Texture(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = operator new();
  jet_texture::jet_texture((jet_texture *)v4);
  *(_QWORD *)v4 = off_24D1A4470;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_BYTE *)(v4 + 40) = 0;
  *(_OWORD *)(v4 + 8) = 0u;
  objc_storeStrong((id *)(v4 + 8), a2);
  *(_DWORD *)(v4 + 32) = getJetTextureFormatFromMetalPixelFormat(objc_msgSend(v3, "pixelFormat"));
  *(_DWORD *)(v4 + 44) = objc_msgSend(v3, "arrayLength");

  return v4;
}

void sub_2144D4D84(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x2199CF8AC](v2, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_sampler(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v12 = (void *)objc_opt_new();
  v13 = v12;
  v14 = 3;
  if (a2 != 2)
    v14 = 0;
  if (a2 == 1)
    v15 = 2;
  else
    v15 = v14;
  objc_msgSend(v12, "setSAddressMode:", v15);
  v16 = 3;
  if (a3 != 2)
    v16 = 0;
  if (a3 == 1)
    v17 = 2;
  else
    v17 = v16;
  objc_msgSend(v13, "setTAddressMode:", v17);
  objc_msgSend(v13, "setMinFilter:", a4 != 0);
  objc_msgSend(v13, "setMagFilter:", a5 != 0);
  if (a6 == 1)
    v18 = 1;
  else
    v18 = 2 * (a6 == 2);
  objc_msgSend(v13, "setMipFilter:", v18);
  v19 = objc_msgSend(*(id *)(a1 + 104), "newSamplerStateWithDescriptor:", v13);
  v20 = operator new();
  jet_sampler::jet_sampler((jet_sampler *)v20);
  *(_QWORD *)v20 = &off_24D1A4508;
  *(_QWORD *)(v20 + 32) = v19;
  *(_DWORD *)(v20 + 8) = a2;
  *(_DWORD *)(v20 + 12) = a3;
  *(_DWORD *)(v20 + 16) = a4;
  *(_DWORD *)(v20 + 20) = a5;
  *(_DWORD *)(v20 + 24) = a6;

  return v20;
}

void sub_2144D4ED8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x2199CF8AC](v3, 0x1081C40A4B734D1);

  _Unwind_Resume(a1);
}

_QWORD *jet_context_Metal::create_function(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  id v14;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 104);
    v14 = 0;
    v9 = (void *)objc_msgSend(v8, "newLibraryWithFile:error:", v7, &v14);
    v10 = v14;

    if (v10)
      jet_log(CFSTR("%@"), v10);
  }
  else
  {
    v10 = 0;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 104), "newDefaultLibrary");
  }
  v11 = (void *)objc_msgSend(v9, "newFunctionWithName:", v6);
  if (v11)
  {
    v12 = (_QWORD *)operator new();
    *v12 = &off_24D1A4540;
    v12[1] = v11;
  }
  else
  {
    jet_log(CFSTR("failed to load function '%s' from file '%s'"), a2, a3);
    v12 = 0;
  }

  return v12;
}

void sub_2144D5044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

_QWORD *jet_context_Metal::create_function_from_source(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  id v18;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 104);
  v18 = 0;
  v11 = (void *)objc_msgSend(v10, "newLibraryWithSource:options:error:", v8, 0, &v18);
  v12 = v18;
  v13 = v12;
  if (v11)
  {
    v14 = (id)objc_msgSend(v11, "newFunctionWithName:", v9);
    if (v14)
    {
      v15 = (_QWORD *)operator new();
      *v15 = &off_24D1A4540;
      v14 = v14;
      v15[1] = v14;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    if (!v12 || (jet_log(CFSTR("%@"), v12), !a5))
    {
      v15 = 0;
      goto LABEL_10;
    }
    v16 = (_QWORD *)operator new();
    objc_msgSend(v13, "localizedDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v16, (char *)objc_msgSend(v14, "UTF8String"));
    v15 = 0;
    *a5 = v16;
  }

LABEL_10:
  return v15;
}

void sub_2144D51F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  MEMORY[0x2199CF8AC](v5, 0x1012C40EC159624);

  _Unwind_Resume(a1);
}

id *jet_context_Metal::create_program(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  id v6;
  id *v7;

  if (!a2)
    jet_context_Metal::create_program();
  if (!a3)
    jet_context_Metal::create_program();
  v5 = *(id *)(a2 + 8);
  if (!v5)
    jet_context_Metal::create_program();

  v6 = *(id *)(a3 + 8);
  if (!v6)
    jet_context_Metal::create_program();

  v7 = (id *)operator new();
  jet_program::jet_program((jet_program *)v7);
  *v7 = &off_24D1A4578;
  v7[5] = 0;
  v7[4] = 0;
  objc_storeStrong(v7 + 4, *(id *)(a2 + 8));
  objc_storeStrong(v7 + 5, *(id *)(a3 + 8));
  return v7;
}

void sub_2144D5310(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C404C70C626);
  _Unwind_Resume(a1);
}

_QWORD *jet_context_Metal::create_function_from_Metal_Function(uint64_t a1, void *a2)
{
  id v2;
  _QWORD *result;

  v2 = a2;
  result = (_QWORD *)operator new();
  *result = &off_24D1A4540;
  result[1] = v2;
  return result;
}

void sub_2144D5378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_render_mode(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9, unsigned __int8 a10, unsigned int a11)
{
  id v16;
  void *v17;
  uint64_t MetalPixelFormat;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  MTLRenderPipelineReflection *v118;
  id v119;
  void *v120;
  uint64_t v121;
  const char *v123;
  int v124;
  int v125;
  void *v126;
  id v130;
  id v131;
  id v132;

  v16 = *(id *)(a2 + 32);
  v130 = *(id *)(a2 + 40);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setVertexFunction:", v16);
  objc_msgSend(v17, "setFragmentFunction:", v130);
  MetalPixelFormat = getMetalPixelFormat(a4);
  objc_msgSend(v17, "colorAttachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPixelFormat:", MetalPixelFormat);

  objc_msgSend(v17, "setSampleCount:", a11);
  if (a5 == 11 || a6 == 11)
  {
    if (a6 != 11 || a5 != 11)
    {
      if (a6 == 11)
        v123 = "destDepthFormat == jet_texture_format_DepthStencil";
      else
        v123 = "destStencilFormat == jet_texture_format_DepthStencil";
      if (a6 == 11)
        v124 = 895;
      else
        v124 = 894;
      __assert_rtn("create_render_mode", "jet_context_Metal.mm", v124, v123);
    }
    v21 = 260;
    objc_msgSend(v17, "setDepthAttachmentPixelFormat:", 260);
  }
  else
  {
    objc_msgSend(v17, "setDepthAttachmentPixelFormat:", getMetalPixelFormat(a5));
    v21 = getMetalPixelFormat(a6);
  }
  objc_msgSend(v17, "setStencilAttachmentPixelFormat:", v21);
  v126 = v16;
  v125 = a4;
  v22 = 8;
  if (!a7)
    v22 = 0;
  if (a8)
    v22 |= 4uLL;
  if (a9)
    v23 = v22 | 2;
  else
    v23 = v22;
  objc_msgSend(v17, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWriteMask:", v23 | a10);

  switch(a3)
  {
    case 1:
      objc_msgSend(v17, "colorAttachments");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBlendingEnabled:", 0);

      objc_msgSend(v17, "colorAttachments");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setRgbBlendOperation:", 0);
      break;
    case 2:
      objc_msgSend(v17, "colorAttachments");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectAtIndexedSubscript:", 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "objectAtIndexedSubscript:", 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setRgbBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setSourceRGBBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectAtIndexedSubscript:", 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setDestinationRGBBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setSourceAlphaBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationAlphaBlendFactor:", 1);
      break;
    case 3:
      objc_msgSend(v17, "colorAttachments");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAlphaBlendOperation:", 2);

      objc_msgSend(v17, "colorAttachments");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setRgbBlendOperation:", 2);

      objc_msgSend(v17, "colorAttachments");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setSourceRGBBlendFactor:", 4);

      objc_msgSend(v17, "colorAttachments");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setDestinationRGBBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setSourceAlphaBlendFactor:", 0);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationAlphaBlendFactor:", 10);
      break;
    case 4:
      objc_msgSend(v17, "colorAttachments");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setRgbBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setSourceRGBBlendFactor:", 6);

      objc_msgSend(v17, "colorAttachments");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setDestinationRGBBlendFactor:", 0);

      objc_msgSend(v17, "colorAttachments");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setSourceAlphaBlendFactor:", 10);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationAlphaBlendFactor:", 0);
      break;
    case 5:
      objc_msgSend(v17, "colorAttachments");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setRgbBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSourceRGBBlendFactor:", 6);

      objc_msgSend(v17, "colorAttachments");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setDestinationRGBBlendFactor:", 2);

      objc_msgSend(v17, "colorAttachments");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setSourceAlphaBlendFactor:", 10);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationAlphaBlendFactor:", 0);
      break;
    case 6:
      objc_msgSend(v17, "colorAttachments");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectAtIndexedSubscript:", 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "objectAtIndexedSubscript:", 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setRgbBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "objectAtIndexedSubscript:", 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setSourceRGBBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setDestinationRGBBlendFactor:", 3);

      objc_msgSend(v17, "colorAttachments");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "objectAtIndexedSubscript:", 0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setSourceAlphaBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationAlphaBlendFactor:", 3);
      break;
    case 7:
      objc_msgSend(v17, "colorAttachments");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "objectAtIndexedSubscript:", 0);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectAtIndexedSubscript:", 0);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setRgbBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "setSourceRGBBlendFactor:", 6);

      objc_msgSend(v17, "colorAttachments");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "objectAtIndexedSubscript:", 0);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setDestinationRGBBlendFactor:", 5);

      objc_msgSend(v17, "colorAttachments");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "objectAtIndexedSubscript:", 0);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "setSourceAlphaBlendFactor:", 10);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationAlphaBlendFactor:", 5);
      break;
    default:
      objc_msgSend(v17, "colorAttachments");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setRgbBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setSourceRGBBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setDestinationRGBBlendFactor:", 5);

      objc_msgSend(v17, "colorAttachments");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectAtIndexedSubscript:", 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setSourceAlphaBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationAlphaBlendFactor:", 5);
      break;
  }

  v116 = *(void **)(a1 + 104);
  v131 = 0;
  v132 = 0;
  v117 = (void *)objc_msgSend(v116, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v17, 3, &v132, &v131);
  v118 = (MTLRenderPipelineReflection *)v132;
  v119 = v131;
  v120 = v119;
  if (v119)
    jet_log(CFSTR("%@"), v119);
  if (!v117)
    __assert_rtn("create_render_mode", "jet_context_Metal.mm", 1032, "state");
  v121 = operator new();
  jet_render_mode::jet_render_mode((jet_render_mode *)v121);
  *(_QWORD *)v121 = &off_24D1A45B0;
  *(_OWORD *)(v121 + 56) = 0u;
  *(_OWORD *)(v121 + 40) = 0u;
  *(_OWORD *)(v121 + 72) = 0u;
  *(_DWORD *)(v121 + 88) = 1065353216;
  *(_OWORD *)(v121 + 96) = 0u;
  *(_OWORD *)(v121 + 112) = 0u;
  *(_DWORD *)(v121 + 128) = 1065353216;
  objc_storeStrong((id *)(v121 + 40), v117);
  jet_render_mode_Metal::set_Metal_Reflection((id *)v121, v118);
  *(_QWORD *)(v121 + 8) = a2;
  *(_DWORD *)(v121 + 16) = a3;
  *(_DWORD *)(v121 + 20) = v125;
  *(_DWORD *)(v121 + 24) = a5;
  *(_DWORD *)(v121 + 28) = a6;
  *(_BYTE *)(v121 + 32) = a7;
  *(_BYTE *)(v121 + 33) = a8;
  *(_BYTE *)(v121 + 34) = a9;
  *(_BYTE *)(v121 + 35) = a10;
  *(_DWORD *)(v121 + 36) = a11;

  return v121;
}

void sub_2144D6070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void jet_render_mode_Metal::set_Metal_Reflection(id *this, MTLRenderPipelineReflection *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  int v16;
  id v17;
  MTLRenderPipelineReflection *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *__p[2];
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void **v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  objc_storeStrong(this + 6, a2);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(this[6], "vertexArguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "index", v18);
        objc_msgSend(v8, "name");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
        v29 = __p;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(this + 7), (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v29)+ 10) = v9;
        if (v24 < 0)
          operator delete(__p[0]);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(this[6], "fragmentArguments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        v16 = objc_msgSend(v15, "index", v18);
        objc_msgSend(v15, "name");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
        v29 = __p;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(this + 12), (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v29)+ 10) = v16;
        if (v24 < 0)
          operator delete(__p[0]);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v12);
  }

}

void sub_2144D6544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::set_scheduled_handler(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  _QWORD v6[4];
  _BYTE v7[24];
  _BYTE *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 128);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = ___ZN17jet_context_Metal21set_scheduled_handlerENSt3__18functionIFvvEEE_block_invoke;
  v6[3] = &__block_descriptor_64_ea8_32c27_ZTSNSt3__18functionIFvvEEE_e28_v16__0___MTLCommandBuffer__8l;
  v3 = v7;
  std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100]((uint64_t)v7, a2);
  result = objc_msgSend(v2, "addScheduledHandler:", v6);
  if (v8 == v7)
  {
    v5 = 4;
  }
  else
  {
    if (!v8)
      return result;
    v5 = 5;
    v3 = v8;
  }
  return (*(uint64_t (**)(_QWORD *))(*v3 + 8 * v5))(v3);
}

void sub_2144D66A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17)
{
  _QWORD *v17;
  uint64_t v19;

  if (a17 == v17)
  {
    v19 = 4;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
    v17 = a17;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void ___ZN17jet_context_Metal21set_scheduled_handlerENSt3__18functionIFvvEEE_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 48))(v3);

}

void sub_2144D6734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void jet_context_Metal::begin_render_pass(jet_context_Metal *this, jet_framebuffer *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id *v18;
  id *v19;
  id *v20;
  int v21;
  int v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  uint64_t v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  int JetTextureFormatFromMetalPixelFormat;
  void *v67;
  void *v68;
  int v69;
  float v70;
  float v71;
  float v72;
  float v73;
  id v74;
  uint64_t v75;
  std::__shared_weak_count *v76;

  (*(void (**)(jet_context_Metal *))(*(_QWORD *)this + 352))(this);
  if (a2)
  {
    *((_QWORD *)this + 2) = a2;
    if (v4 && (v5 = v4, (v6 = (void *)v4[32]) != 0))
    {
      v7 = v6;
      if (v7 != *((id *)this + 17))
      {
        (*(void (**)(uint64_t *__return_ptr, jet_context_Metal *))(*(_QWORD *)this + 176))(&v75, this);
        v8 = v76;
        if (v76)
        {
          p_shared_owners = (unint64_t *)&v76->__shared_owners_;
          do
            v10 = __ldaxr(p_shared_owners);
          while (__stlxr(v10 - 1, p_shared_owners));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
        objc_storeStrong((id *)this + 17, v6);
        jet_context_Metal::ensureCommandBuffer((uint64_t)this, 1);
      }
      *((_QWORD *)this + 1) = 0;
      objc_storeStrong((id *)this + 18, (id)v5[33]);
      v11 = (void *)*((_QWORD *)this + 18);
      if (v11)
      {
        objc_msgSend(v11, "colorAttachments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "texture");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          *((_DWORD *)this + 6) = getJetTextureFormatFromMetalPixelFormat(objc_msgSend(v14, "pixelFormat"));
          v15 = objc_msgSend(v14, "sampleCount");
        }
        else
        {
          *((_DWORD *)this + 6) = 0;
          v15 = 1;
        }
        *((_DWORD *)this + 9) = v15;
        objc_msgSend(*((id *)this + 18), "depthAttachment");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "texture");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (v65)
          JetTextureFormatFromMetalPixelFormat = getJetTextureFormatFromMetalPixelFormat(objc_msgSend(v65, "pixelFormat"));
        else
          JetTextureFormatFromMetalPixelFormat = 0;
        *((_DWORD *)this + 7) = JetTextureFormatFromMetalPixelFormat;
        objc_msgSend(*((id *)this + 18), "stencilAttachment");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "texture");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
          v69 = getJetTextureFormatFromMetalPixelFormat(objc_msgSend(v68, "pixelFormat"));
        else
          v69 = 0;
        *((_DWORD *)this + 8) = v69;

      }
      objc_msgSend(*((id *)this + 17), "setCullMode:", 0);

    }
    else
    {
      v16 = (void *)*((_QWORD *)this + 17);
      if (v16)
      {
        objc_msgSend(v16, "endEncoding");
        v17 = (void *)*((_QWORD *)this + 17);
        *((_QWORD *)this + 17) = 0;

      }
      v18 = (id *)*((_QWORD *)a2 + 2);
      v19 = (id *)*((_QWORD *)a2 + 26);
      v20 = (id *)*((_QWORD *)a2 + 29);
      if (v18 && ((*((uint64_t (**)(_QWORD))*v18 + 12))(*((_QWORD *)a2 + 2)) & 1) == 0)
        jet_context_Metal::begin_render_pass();
      if (v19 && ((*((uint64_t (**)(id *))*v19 + 13))(v19) & 1) == 0)
        jet_context_Metal::begin_render_pass();
      if (v20 && ((*((uint64_t (**)(id *))*v20 + 14))(v20) & 1) == 0)
        jet_context_Metal::begin_render_pass();
      if (v18)
        v21 = (*((uint64_t (**)(id *))*v18 + 4))(v18);
      else
        v21 = 3;
      *((_DWORD *)this + 6) = v21;
      if (v19)
        v22 = (*((uint64_t (**)(id *))*v19 + 4))(v19);
      else
        v22 = 0;
      *((_DWORD *)this + 7) = v22;
      if (v20)
        v23 = (*((uint64_t (**)(id *))*v20 + 4))(v20);
      else
        v23 = 0;
      *((_DWORD *)this + 8) = v23;
      getMetalTexture(v18);
      v74 = (id)objc_claimAutoreleasedReturnValue();
      if (v74)
        *((_DWORD *)this + 9) = objc_msgSend(v74, "sampleCount");
      if (v19 && (*((unsigned int (**)(id *))*v19 + 4))(v19) == 11)
      {
        v24 = v19[1];
      }
      else
      {
        getMetalTexture(v19);
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;
      if (v20 && (*((unsigned int (**)(id *))*v20 + 4))(v20) == 11)
      {
        v26 = v20[2];
      }
      else
      {
        getMetalTexture(v19);
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v27 = v26;
      v28 = *((unsigned int *)a2 + 60);
      v29 = *((float *)a2 + 54);
      objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor", *((_QWORD *)a2 + 4), *((_QWORD *)a2 + 5));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "colorAttachments");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setTexture:", v74);

      objc_msgSend(v30, "colorAttachments");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setClearColor:", v70, v71, v72, v73);

      v35 = *((_DWORD *)a2 + 12);
      if (v35 == 1)
        v36 = 2;
      else
        v36 = v35 == 0;
      objc_msgSend(v30, "colorAttachments");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setLoadAction:", v36);

      v39 = *((_DWORD *)a2 + 13) != 1;
      objc_msgSend(v30, "colorAttachments");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setStoreAction:", v39);

      objc_msgSend(v30, "stencilAttachment");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTexture:", v27);

      objc_msgSend(v30, "stencilAttachment");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setClearStencil:", v28);

      v44 = *((_DWORD *)a2 + 61);
      objc_msgSend(v30, "stencilAttachment");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (v44 == 1)
        v47 = 2;
      else
        v47 = v44 == 0;
      objc_msgSend(v45, "setLoadAction:", v47);

      v48 = *((_DWORD *)a2 + 62);
      objc_msgSend(v30, "stencilAttachment");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setStoreAction:", v48 != 1);

      objc_msgSend(v30, "depthAttachment");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setTexture:", v25);

      objc_msgSend(v30, "depthAttachment");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setClearDepth:", v29);

      v52 = *((_DWORD *)a2 + 55);
      objc_msgSend(v30, "depthAttachment");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v52 == 1)
        v55 = 2;
      else
        v55 = v52 == 0;
      objc_msgSend(v53, "setLoadAction:", v55);

      v56 = *((_DWORD *)a2 + 56);
      objc_msgSend(v30, "depthAttachment");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setStoreAction:", v56 != 1);

      jet_context_Metal::ensureCommandQueue(this);
      jet_context_Metal::ensureCommandBuffer((uint64_t)this, 0);
      objc_msgSend(*((id *)this + 16), "renderCommandEncoderWithDescriptor:", v30);
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)*((_QWORD *)this + 17);
      *((_QWORD *)this + 17) = v58;

      objc_msgSend(*((id *)this + 17), "setLabel:", CFSTR("SpriteKit Render"));
      objc_storeStrong((id *)this + 18, v30);
      if (v18)
      {
        v60 = (*(uint64_t (**)(id *))*v18)(v18);
        v61 = (*((uint64_t (**)(id *))*v18 + 1))(v18);
        (*(void (**)(jet_context_Metal *, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)this + 208))(this, 0, 0, v60, v61);
        v62 = (*(uint64_t (**)(id *))*v18)(v18);
        v63 = (*((uint64_t (**)(id *))*v18 + 1))(v18);
        (*(void (**)(jet_context_Metal *, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)this + 224))(this, 0, 0, v62, v63);
      }

    }
  }
}

void sub_2144D6E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

jet_texture *getMetalTexture(id *a1)
{
  if (a1)
    a1 = (id *)a1[1];
  return (jet_texture *)a1;
}

void jet_context_Metal::ensureCommandQueue(jet_context_Metal *this)
{
  uint64_t v2;
  void *v3;

  if (!*((_QWORD *)this + 15))
  {
    jet_context_Metal::getNativeCommandQueue(this);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)*((_QWORD *)this + 15);
    *((_QWORD *)this + 15) = v2;

  }
}

jet_stencil_mode *jet_context_Metal::create_stencil_mode(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  jet_stencil_mode *v18;

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setReadMask:", a6);
  objc_msgSend(v13, "setWriteMask:", a7);
  if (a2 > 7)
    v14 = 7;
  else
    v14 = qword_2144DE2E0[a2];
  objc_msgSend(v13, "setStencilCompareFunction:", v14);
  if (a3 > 4)
    v15 = 0;
  else
    v15 = qword_2144DE2B8[a3];
  objc_msgSend(v13, "setStencilFailureOperation:", v15);
  if (a4 > 4)
    v16 = 0;
  else
    v16 = qword_2144DE2B8[a4];
  objc_msgSend(v13, "setDepthFailureOperation:", v16);
  if (a5 > 4)
    v17 = 0;
  else
    v17 = qword_2144DE2B8[a5];
  objc_msgSend(v13, "setDepthStencilPassOperation:", v17);
  v18 = (jet_stencil_mode *)operator new();
  jet_stencil_mode::jet_stencil_mode(v18);
  *(_QWORD *)v18 = &off_24D1A4630;
  *((_QWORD *)v18 + 1) = v13;
  return v18;
}

void sub_2144D70DC(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x2199CF8AC](v2, 0x81C40803F642BLL);

  _Unwind_Resume(a1);
}

jet_depth_stencil_mode *jet_context_Metal::create_depth_stencil_mode(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  jet_depth_stencil_mode *v14;
  id v15;
  void *v16;

  if (a5)
    v9 = a5;
  else
    v9 = a4;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (a3 > 7)
    v12 = 7;
  else
    v12 = qword_2144DE2E0[a3];
  objc_msgSend(v10, "setDepthCompareFunction:", v12);
  objc_msgSend(v11, "setDepthWriteEnabled:", a2);
  objc_msgSend(v11, "setFrontFaceStencil:", *(_QWORD *)(a4 + 8));
  objc_msgSend(v11, "setBackFaceStencil:", *(_QWORD *)(v9 + 8));
  v13 = objc_msgSend(*(id *)(a1 + 104), "newDepthStencilStateWithDescriptor:", v11);
  if (!v13)
    __assert_rtn("create_depth_stencil_mode", "jet_context_Metal.mm", 1241, "state");
  v14 = (jet_depth_stencil_mode *)operator new();
  jet_depth_stencil_mode::jet_depth_stencil_mode(v14);
  *((_QWORD *)v14 + 1) = v11;
  *((_QWORD *)v14 + 2) = 0;
  *(_QWORD *)v14 = &off_24D1A4668;
  v15 = v11;
  v16 = (void *)*((_QWORD *)v14 + 2);
  *((_QWORD *)v14 + 2) = v13;

  return v14;
}

void sub_2144D722C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = v3;
  MEMORY[0x2199CF8AC](v4, 0x81C40D6874129);

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::set_wireframe_mode(id *this, unsigned int a2)
{
  return objc_msgSend(this[17], "setTriangleFillMode:", a2);
}

uint64_t jet_context_Metal::set_scissor_rect(jet_context_Metal *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  int v14;
  void *v15;
  _QWORD v17[4];

  v8 = a4;
  v9 = *((_QWORD *)this + 2);
  v10 = a5;
  if (v9)
  {
    v11 = *(_QWORD *)(v9 + 16);
    if (v11)
    {
      v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
      v14 = (***(uint64_t (****)(_QWORD))(*((_QWORD *)this + 2) + 16))(*(_QWORD *)(*((_QWORD *)this + 2)
                                                                                             + 16));
      a3 = (v13 - (a5 + a3)) & ~((int)(v13 - (a5 + a3)) >> 31);
      v10 = v13;
      v8 = v14;
    }
  }
  v15 = (void *)*((_QWORD *)this + 17);
  v17[0] = a2;
  v17[1] = a3;
  v17[2] = v8;
  v17[3] = v10;
  return objc_msgSend(v15, "setScissorRect:", v17);
}

uint64_t jet_context_Metal::set_stencil_reference_value(id *this, uint64_t a2)
{
  return objc_msgSend(this[17], "setStencilReferenceValue:", a2);
}

uint64_t jet_context_Metal::use_depth_stencil_mode(jet_context_Metal *this, jet_depth_stencil_mode *a2)
{
  void *v3;
  uint64_t *v4;
  _QWORD block[5];

  if (a2)
  {
    v3 = (void *)*((_QWORD *)this + 17);
    v4 = (uint64_t *)((char *)a2 + 16);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN17jet_context_Metal22use_depth_stencil_modeEP22jet_depth_stencil_mode_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    if (jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::onceToken != -1)
      dispatch_once(&jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::onceToken, block);
    v3 = (void *)*((_QWORD *)this + 17);
    v4 = &jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::_defualtDepthStencilState;
  }
  return objc_msgSend(v3, "setDepthStencilState:", *v4);
}

void ___ZN17jet_context_Metal22use_depth_stencil_modeEP22jet_depth_stencil_mode_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_opt_new();
  v2 = objc_msgSend(*(id *)(v1 + 104), "newDepthStencilStateWithDescriptor:");
  v3 = (void *)jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::_defualtDepthStencilState;
  jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::_defualtDepthStencilState = v2;

}

void sub_2144D742C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::use_render_mode(jet_context_Metal *this, jet_render_mode *a2)
{
  *((_QWORD *)this + 1) = a2;
  return objc_msgSend(*((id *)this + 17), "setRenderPipelineState:", *((_QWORD *)a2 + 5));
}

uint64_t jet_context_Metal::set_viewport(jet_context_Metal *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v10;
  double v11;
  void *v12;
  double v14[4];
  __int128 v15;

  v10 = *((_QWORD *)this + 2);
  if (v10 && ((*(uint64_t (**)(_QWORD))(**(_QWORD **)(v10 + 16) + 88))(*(_QWORD *)(v10 + 16)) & 1) == 0)
  {
    a3 += a5;
    v11 = (float)-(float)a5;
  }
  else
  {
    v11 = (double)a5;
  }
  v12 = (void *)*((_QWORD *)this + 17);
  v14[0] = (double)a2;
  v14[1] = (double)a3;
  v14[2] = (double)a4;
  v14[3] = v11;
  v15 = xmmword_2144DE3A0;
  return objc_msgSend(v12, "setViewport:", v14);
}

void jet_context_Metal::set_vertex_buffer(jet_context_Metal *this, jet_buffer *a2, int a3)
{
  void *v6;
  id v7;

  jet_context::add_fenced_buffer(this, a2);
  if (a3 < 0)
    jet_context_Metal::set_vertex_buffer();
  v6 = (void *)*((_QWORD *)this + 17);
  getMetalBuffer((id *)a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVertexBuffer:offset:atIndex:");

}

void sub_2144D7560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

jet_buffer *getMetalBuffer(id *a1)
{
  if (a1)
    a1 = (id *)a1[12];
  return (jet_buffer *)a1;
}

void jet_context_Metal::set_vertex_constant(jet_context_Metal *this, id *a2, int a3)
{
  void *v3;
  id v4;

  if (a3 < 0)
    jet_context_Metal::set_vertex_constant();
  v3 = (void *)*((_QWORD *)this + 17);
  getMetalBuffer(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVertexBuffer:offset:atIndex:");

}

void sub_2144D75E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

jet_constant *getMetalBuffer(id *a1)
{
  if (a1)
    a1 = (id *)a1[3];
  return (jet_constant *)a1;
}

uint64_t jet_context_Metal::set_vertex_constant(uint64_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  int v6;

  if ((a6 & 0x80000000) != 0)
    jet_context_Metal::set_vertex_constant();
  if (!a5)
    jet_context_Metal::set_vertex_constant();
  if (a4 != 1)
    jet_context_Metal::set_vertex_constant();
  if ((a2 - 1) > 7)
    v6 = 4;
  else
    v6 = dword_2144DE320[a2 - 1];
  return objc_msgSend(*(id *)(a1 + 136), "setVertexBytes:length:atIndex:", a5, (v6 * a3), a6);
}

void jet_context_Metal::set_vertex_texture(jet_context_Metal *this, id *a2, int a3)
{
  void *v3;
  id v4;

  if (a3 < 0)
    jet_context_Metal::set_vertex_texture();
  v3 = (void *)*((_QWORD *)this + 17);
  getMetalTexture(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVertexTexture:atIndex:");

}

void sub_2144D76CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void jet_context_Metal::set_vertex_sampler(jet_context_Metal *this, id *a2, int a3)
{
  void *v3;
  id v4;

  if (a3 < 0)
    jet_context_Metal::set_vertex_sampler();
  v3 = (void *)*((_QWORD *)this + 17);
  getMetalSampler(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVertexSamplerState:atIndex:");

}

void sub_2144D7734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

jet_sampler *getMetalSampler(id *a1)
{
  if (a1)
    a1 = (id *)a1[4];
  return (jet_sampler *)a1;
}

void jet_context_Metal::set_fragment_texture(jet_context_Metal *this, id *a2, int a3)
{
  void *v3;
  id v4;

  if (a3 < 0)
    jet_context_Metal::set_fragment_texture();
  v3 = (void *)*((_QWORD *)this + 17);
  getMetalTexture(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFragmentTexture:atIndex:");

}

void sub_2144D77B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void jet_context_Metal::set_fragment_sampler(jet_context_Metal *this, id *a2, int a3)
{
  void *v3;
  id v4;

  if (a3 < 0)
    jet_context_Metal::set_fragment_sampler();
  v3 = (void *)*((_QWORD *)this + 17);
  getMetalSampler(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFragmentSamplerState:atIndex:");

}

void sub_2144D7820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void jet_context_Metal::set_fragment_constant(jet_context_Metal *this, id *a2, int a3)
{
  void *v3;
  id v4;

  if (a3 < 0)
    jet_context_Metal::set_fragment_constant();
  v3 = (void *)*((_QWORD *)this + 17);
  getMetalBuffer(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFragmentBuffer:offset:atIndex:");

}

void sub_2144D788C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::set_fragment_constant(uint64_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  int v6;

  if ((a6 & 0x80000000) != 0)
    jet_context_Metal::set_fragment_constant();
  if (!a5)
    jet_context_Metal::set_fragment_constant();
  if (a4 != 1)
    jet_context_Metal::set_fragment_constant();
  if ((a2 - 1) > 7)
    v6 = 4;
  else
    v6 = dword_2144DE320[a2 - 1];
  return objc_msgSend(*(id *)(a1 + 136), "setFragmentBytes:length:atIndex:", a5, (v6 * a3), a6);
}

uint64_t jet_context_Metal::draw(uint64_t result, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4;

  if (a4)
  {
    if (a2 >= 5)
      v4 = 3;
    else
      v4 = a2;
    return objc_msgSend(*(id *)(result + 136), "drawPrimitives:vertexStart:vertexCount:", v4, a3, a4);
  }
  return result;
}

void jet_context_Metal::draw_indexed(uint64_t a1, unsigned int a2, jet_buffer *a3, unsigned int a4, unsigned int a5)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL8 v12;
  unsigned int v13;
  int v14;
  id v15;

  if (a5)
  {
    if ((*((_DWORD *)a3 + 10) - 5) <= 0xFFFFFFFD)
      jet_context_Metal::draw_indexed();
    if (a2 >= 5)
      v9 = 3;
    else
      v9 = a2;
    getMetalBuffer((id *)a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *((_DWORD *)a3 + 10);
    v12 = v11 == 4;
    v13 = v11 - 1;
    if (v13 > 7)
      v14 = 4;
    else
      v14 = dword_2144DE320[v13];
    v15 = (id)v10;
    objc_msgSend(*(id *)(a1 + 136), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", v9, a5, v12, v10, a4 * (unint64_t)(*((_DWORD *)a3 + 11) * v14));

  }
}

void sub_2144D7A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void jet_context_Metal::present(jet_context_Metal *this, id *a2, double a3)
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2[3];
  if (!v10)
    __assert_rtn("present", "jet_context_Metal.mm", 1438, "drawable");
  v6 = (void *)*((_QWORD *)this + 16);
  if (a3 <= 0.0)
    objc_msgSend(v6, "presentDrawable:", v10);
  else
    objc_msgSend(v6, "presentDrawable:atTime:", v10, a3);
  (*(void (**)(jet_context_Metal *))(*(_QWORD *)this + 176))(this);
  v7 = a2[3];
  a2[3] = 0;

  v8 = a2[1];
  a2[1] = 0;

  v9 = a2[2];
  a2[2] = 0;

}

void sub_2144D7AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::commit@<X0>(jet_context_Metal *this@<X0>, _QWORD *a2@<X8>)
{
  const void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  __int128 v15;

  v4 = (const void *)*((_QWORD *)this + 2);
  if (!v4
  {
    v9 = (void *)*((_QWORD *)this + 17);
    goto LABEL_7;
  }
  jet_context_Metal::getNativeCommandQueue(this);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)this + 15);
  *((_QWORD *)this + 15) = v7;

  v9 = (void *)*((_QWORD *)this + 17);
  if ((void *)v6[32] != v9)
LABEL_7:
    objc_msgSend(v9, "endEncoding");
  *a2 = 0;
  a2[1] = 0;
  if (*((_QWORD *)this + 17))
  {
    (*(void (**)(__int128 *__return_ptr, jet_context_Metal *))(*(_QWORD *)this + 328))(&v15, this);
    std::shared_ptr<jet_fence>::operator=[abi:ne180100]((uint64_t)a2, &v15);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (*((_QWORD *)&v15 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (void *)*((_QWORD *)this + 17);
    *((_QWORD *)this + 17) = 0;

    objc_msgSend(*((id *)this + 16), "commit");
  }
  jet_context_Metal::ensureCommandQueue(this);
  return jet_context_Metal::ensureCommandBuffer((uint64_t)this, 1);
}

void sub_2144D7C30(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

id jet_context_Metal::getNativeCommandQueue(jet_context_Metal *this)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)*((_QWORD *)this + 14);
  if (!v2)
  {
    v3 = objc_msgSend(*((id *)this + 13), "newCommandQueue");
    v4 = (void *)*((_QWORD *)this + 14);
    *((_QWORD *)this + 14) = v3;

    v5 = (void *)*((_QWORD *)this + 14);
    jet_getClientLabel();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabel:", v6);

    v2 = (void *)*((_QWORD *)this + 14);
  }
  return v2;
}

void sub_2144D7CAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double jet_context_Metal::create_fence@<D0>(id *this@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  double result;
  __int128 v11;
  __int128 v12;

  v4 = operator new();
  *(_QWORD *)v4 = off_24D1A46A0;
  *(_BYTE *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  std::shared_ptr<jet_fence_Metal>::shared_ptr[abi:ne180100]<jet_fence_Metal,void>(&v12, v4);
  objc_storeStrong((id *)(v12 + 16), this[16]);
  std::shared_ptr<jet_fence>::operator=[abi:ne180100](this + 5, (uint64_t *)&v12);
  v11 = v12;
  if (*((_QWORD *)&v12 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  jet_context::clear_fenced_buffers((uint64_t)this, (uint64_t *)&v11);
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  result = *(double *)&v12;
  *a2 = v12;
  return result;
}

void sub_2144D7DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::get_max_texture_size(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int64x2_t v4;
  int8x16_t v5;

  v3 = objc_msgSend(*(id *)(a1 + 104), "featureProfile");
  if (a2 > 2)
    return 0;
  v4 = vdupq_n_s64(v3);
  v5.i64[0] = 0x400000004000;
  v5.i64[1] = 0x400000004000;
  return vaddvq_s32(vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_2144DE3C0), (int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_2144DE3B0)), (int8x16_t)xmmword_2144DE3F0), (int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_2144DE3E0), (int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_2144DE3D0)), v5)))+ (((v3 & 0xFFFFFFFFFFFFFFFELL) == 10) << 14);
}

id jet_context_Metal::ensureCIContext(jet_context_Metal *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)*((_QWORD *)this + 12);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BDBF858]);

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BDBF840]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v6, *MEMORY[0x24BDBF848]);

    objc_msgSend(MEMORY[0x24BDBF648], "contextWithMTLDevice:options:", *((_QWORD *)this + 13), v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)this + 12);
    *((_QWORD *)this + 12) = v7;

    v2 = (void *)*((_QWORD *)this + 12);
  }
  return v2;
}

void sub_2144D7F64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void jet_context_Metal::render_CIImage_to_texture(uint64_t a1, void *a2, id *a3, __n128 a4)
{
  id v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGColorSpace *DeviceRGB;
  void *v21;
  const void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  std::__shared_weak_count *v33;
  CGRect v34;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 136);
  if (v7)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)a1 + 176))(&v32, a1);
    v8 = v33;
    if (v33)
    {
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 336))(a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (double)a4.n128_u32[0];
  v13 = (double)a4.n128_u32[1];
  v14 = (double)a4.n128_u32[2];
  v15 = (double)a4.n128_u32[3];
  v34.origin.x = (double)a4.n128_u32[0];
  v34.origin.y = (double)a4.n128_u32[1];
  v34.size.width = (double)a4.n128_u32[2];
  v34.size.height = (double)a4.n128_u32[3];
  if (CGRectIsEmpty(v34))
  {
    objc_msgSend(v6, "extent");
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v15 = v19;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  getMetalTexture(a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "render:toMTLTexture:commandBuffer:bounds:colorSpace:", v6, v21, *(_QWORD *)(a1 + 128), DeviceRGB, v12, v13, v14, v15);

  CGColorSpaceRelease(DeviceRGB);
  v22 = *(const void **)(a1 + 16);
  if (v22)
  {
    if (!v7)
      goto LABEL_17;
  }
  else
  {
    v23 = 0;
    if (!v7)
      goto LABEL_17;
  }
  if (!v23)
  {
    if (*(_QWORD *)(a1 + 144))
    {
      jet_context_Metal::ensureCommandBuffer(a1, 0);
      objc_msgSend(*(id *)(a1 + 128), "renderCommandEncoderWithDescriptor:", *(_QWORD *)(a1 + 144));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v24;

      objc_msgSend(*(id *)(a1 + 136), "setLabel:", CFSTR("SpriteKit Render"));
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
      if (v26)
      {
        v27 = (**(uint64_t (***)(uint64_t))v26)(v26);
        v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
        (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)a1 + 208))(a1, 0, 0, v27, v28);
        v29 = (**(uint64_t (***)(uint64_t))v26)(v26);
        v30 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
        (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)a1 + 224))(a1, 0, 0, v29, v30);
      }
    }
  }
LABEL_17:
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 328))(a1);

}

void sub_2144D8220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id jet_context_Metal::create_CIImage_from_texture(jet_context_Metal *this, id *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBF660];
  getMetalTexture(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithMTLTexture:options:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_2144D82AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_texture_from_CIImage(jet_context_Metal *this, CIImage *a2)
{
  CIImage *v3;
  double v4;
  double v5;
  uint64_t texture_2d;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v3 = a2;
  -[CIImage extent](v3, "extent");
  texture_2d = jet_context::create_texture_2d((uint64_t)this, v4, v5, 3, 0, 0, 0);
  (*(void (**)(uint64_t *__return_ptr, jet_context_Metal *, CIImage *, uint64_t, __n128))(*(_QWORD *)this
                                                                                                 + 160))(&v11, this, v3, texture_2d, (__n128)0);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return texture_2d;
}

void sub_2144D8378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id jet_context_Metal::get_Metal_Device(id *this)
{
  return this[13];
}

id jet_context_Metal::get_Metal_CommandQueue(id *this)
{
  return this[15];
}

id jet_context_Metal::get_Metal_CommandBuffer(id *this)
{
  return this[16];
}

id jet_context_Metal::get_Metal_CommandEncoder(id *this)
{
  return this[17];
}

id jet_context_Metal::get_Metal_RenderPassDescriptor(id *this)
{
  return this[18];
}

uint64_t jet_buffer_Metal::jet_buffer_Metal(uint64_t a1, void *a2, int a3, int a4, int a5, uint64_t a6)
{
  id v11;
  int v12;
  uint64_t v13;
  void *v14;

  v11 = a2;
  jet_buffer::jet_buffer((jet_buffer *)a1);
  *(_QWORD *)a1 = &off_24D1A4298;
  *(_QWORD *)(a1 + 96) = 0;
  if ((a3 - 1) > 7)
    v12 = 4;
  else
    v12 = dword_2144DE320[a3 - 1];
  if (a6)
    v13 = objc_msgSend(v11, "newBufferWithBytes:length:options:", a6, (a5 * a4 * v12), 0);
  else
    v13 = objc_msgSend(v11, "newBufferWithLength:options:", (a5 * a4 * v12), 0);
  v14 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v13;

  *(_DWORD *)(a1 + 40) = a3;
  *(_DWORD *)(a1 + 44) = a4;
  *(_DWORD *)(a1 + 48) = a5;

  return a1;
}

void sub_2144D847C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  jet_buffer::~jet_buffer((dispatch_semaphore_t *)v2);
  _Unwind_Resume(a1);
}

uint64_t jet_buffer_Metal::get_length(id *this)
{
  return objc_msgSend(this[12], "length");
}

void *jet_buffer_Metal::set_data(id *this, const void *a2, unsigned int a3, unsigned int a4)
{
  unsigned int v5;

  v5 = a3;
  if (!a3)
    v5 = objc_msgSend(this[12], "length");
  return memcpy((void *)(objc_msgSend(this[12], "contents") + a4), a2, v5);
}

uint64_t jet_buffer_Metal::get_data(id *this)
{
  return objc_msgSend(this[12], "contents");
}

void jet_buffer_Metal::resize(jet_buffer_Metal *this, int a2)
{
  unsigned int v4;
  int v5;
  size_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  unint64_t v12;
  size_t v13;
  void *v14;

  v4 = *((_DWORD *)this + 10) - 1;
  if (v4 > 7)
    v5 = 4;
  else
    v5 = dword_2144DE320[v4];
  v6 = (v5 * a2 * *((_DWORD *)this + 11));
  objc_msgSend(*((id *)this + 12), "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newBufferWithLength:options:", v6, 0);

  v9 = objc_retainAutorelease(v8);
  v10 = (void *)objc_msgSend(v9, "contents");
  v11 = (const void *)objc_msgSend(*((id *)this + 12), "contents");
  v12 = objc_msgSend(*((id *)this + 12), "length");
  if (v12 >= v6)
    v13 = v6;
  else
    v13 = v12;
  memcpy(v10, v11, v13);
  v14 = (void *)*((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = v9;

  *((_DWORD *)this + 12) = a2;
}

void sub_2144D85EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void jet_buffer_Metal::~jet_buffer_Metal(jet_buffer_Metal *this)
{
  jet_buffer_Metal::~jet_buffer_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;

  *(_QWORD *)this = &off_24D1A4298;
  v2 = (void *)*((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;

  jet_buffer::~jet_buffer((dispatch_semaphore_t *)this);
}

void *jet_buffer_Metal::copy_data(id *this, void *a2, unsigned int a3)
{
  return memcpy(a2, (const void *)objc_msgSend(this[12], "contents"), a3);
}

uint64_t jet_buffer_Metal::set_value(jet_buffer_Metal *this, float a2)
{
  float v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_buffer_Metal *, float *, uint64_t, _QWORD))(*(_QWORD *)this + 8))(this, &v3, 4, 0);
}

uint64_t jet_buffer_Metal::set_value(uint64_t a1, double a2)
{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 8, 0);
}

uint64_t jet_buffer_Metal::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 16, 0);
}

{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 16, 0);
}

uint64_t jet_buffer_Metal::set_value(jet_buffer_Metal *this, __int16 a2)
{
  __int16 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_buffer_Metal *, __int16 *, uint64_t, _QWORD))(*(_QWORD *)this + 8))(this, &v3, 2, 0);
}

uint64_t jet_buffer_Metal::set_value(uint64_t a1, int a2)
{
  int v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(a1, &v3, 4, 0);
}

jet_buffer_pool *jet_buffer_pool_Metal::jet_buffer_pool_Metal(jet_buffer_pool *a1, void *a2, int a3, int a4, int a5)
{
  id v9;
  id v10;

  v9 = a2;
  jet_buffer_pool::jet_buffer_pool((uint64_t)a1, a3, a4, a5);
  *(_QWORD *)a1 = &off_24D1A4340;
  v10 = v9;
  *((_QWORD *)a1 + 8) = v10;
  jet_buffer_pool::initialize_first_buffer(a1);

  return a1;
}

void sub_2144D88BC(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)v2);
  _Unwind_Resume(a1);
}

void jet_buffer_pool_Metal::~jet_buffer_pool_Metal(id *this)
{

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);
}

{

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_buffer_pool_Metal::create_buffer(jet_buffer_pool_Metal *this)
{
  uint64_t v2;

  v2 = operator new();
  jet_buffer_Metal::jet_buffer_Metal(v2, *((void **)this + 8), *((_DWORD *)this + 2), *((_DWORD *)this + 3), *((_DWORD *)this + 4), 0);
  return v2;
}

void sub_2144D8998(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C405BB150DBLL);
  _Unwind_Resume(a1);
}

uint64_t jet_constant_Metal::get_length(id *this)
{
  return objc_msgSend(this[3], "length");
}

void *jet_constant_Metal::set_data(id *this, const void *a2, unsigned int a3)
{
  unsigned int v3;

  v3 = a3;
  if (!a3)
    v3 = objc_msgSend(this[3], "length");
  return memcpy((void *)objc_msgSend(this[3], "contents"), a2, v3);
}

void *jet_constant_Metal::copy_data(id *this, void *a2, unsigned int a3)
{
  return memcpy(a2, (const void *)objc_msgSend(this[3], "contents"), a3);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, float a2)
{
  float v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, float *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 4);
}

uint64_t jet_constant_Metal::set_value(uint64_t a1, double a2)
{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 8);
}

uint64_t jet_constant_Metal::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 16);
}

{
  __n128 v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 16);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, simd_float2x2 a2)
{
  simd_float2x2 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, simd_float2x2 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 16);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, simd_float3x3 a2)
{
  simd_float3x3 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, simd_float3x3 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 48);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, simd_float4x4 a2)
{
  simd_float4x4 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, simd_float4x4 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 64);
}

void jet_constant_Metal::~jet_constant_Metal(jet_constant_Metal *this)
{
  jet_constant_Metal::~jet_constant_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;

  *(_QWORD *)this = off_24D1A4388;
  v2 = (void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;

  jet_constant::~jet_constant(this);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, __int16 a2)
{
  __int16 v3;

  v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, __int16 *, uint64_t))(*(_QWORD *)this + 32))(this, &v3, 2);
}

uint64_t jet_constant_Metal::set_value(uint64_t a1, int a2)
{
  int v3;

  v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t))(*(_QWORD *)a1 + 32))(a1, &v3, 4);
}

void jet_framebuffer_Metal::jet_framebuffer_Metal(jet_framebuffer_Metal *this)
{
  *((_DWORD *)this + 54) = 1065353216;
  *(_QWORD *)((char *)this + 220) = 0x100000001;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 30) = 0x100000000;
  *((_DWORD *)this + 62) = 1;
  *((_QWORD *)this + 2) = 0;
  *((_OWORD *)this + 2) = xmmword_2144DDBB0;
  *((_QWORD *)this + 6) = 1;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_OWORD *)this + 5) = xmmword_2144DDBB0;
  *((_DWORD *)this + 24) = 1;
  *(_QWORD *)((char *)this + 100) = 0;
  *(_QWORD *)((char *)this + 116) = 0;
  *(_QWORD *)((char *)this + 108) = 0;
  *((_DWORD *)this + 31) = 0;
  *((_OWORD *)this + 8) = xmmword_2144DDBB0;
  *((_DWORD *)this + 36) = 1;
  *(_QWORD *)((char *)this + 156) = 0;
  *(_QWORD *)((char *)this + 148) = 0;
  *((_DWORD *)this + 43) = 0;
  *(_QWORD *)((char *)this + 164) = 0;
  *((_OWORD *)this + 11) = xmmword_2144DDBB0;
  *((_QWORD *)this + 24) = 1;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  *(_QWORD *)this = &off_24D1A4448;
  *((_QWORD *)this + 32) = 0;
  *((_QWORD *)this + 33) = 0;
}

void jet_framebuffer_Metal::~jet_framebuffer_Metal(id *this)
{

}

{

  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_framebuffer_Metal::clone(jet_framebuffer_Metal *this)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = operator new();
  v3 = *((_OWORD *)this + 14);
  *(_OWORD *)(v2 + 208) = *((_OWORD *)this + 13);
  *(_OWORD *)(v2 + 224) = v3;
  *(_OWORD *)(v2 + 240) = *((_OWORD *)this + 15);
  v4 = *((_OWORD *)this + 10);
  *(_OWORD *)(v2 + 144) = *((_OWORD *)this + 9);
  *(_OWORD *)(v2 + 160) = v4;
  v5 = *((_OWORD *)this + 12);
  *(_OWORD *)(v2 + 176) = *((_OWORD *)this + 11);
  *(_OWORD *)(v2 + 192) = v5;
  v6 = *((_OWORD *)this + 6);
  *(_OWORD *)(v2 + 80) = *((_OWORD *)this + 5);
  *(_OWORD *)(v2 + 96) = v6;
  v7 = *((_OWORD *)this + 8);
  *(_OWORD *)(v2 + 112) = *((_OWORD *)this + 7);
  *(_OWORD *)(v2 + 128) = v7;
  v8 = *((_OWORD *)this + 2);
  *(_OWORD *)(v2 + 16) = *((_OWORD *)this + 1);
  *(_OWORD *)(v2 + 32) = v8;
  v9 = *((_OWORD *)this + 4);
  *(_OWORD *)(v2 + 48) = *((_OWORD *)this + 3);
  *(_OWORD *)(v2 + 64) = v9;
  *(_QWORD *)v2 = &off_24D1A4448;
  *(_QWORD *)(v2 + 256) = *((id *)this + 32);
  *(_QWORD *)(v2 + 264) = *((id *)this + 33);
  return v2;
}

uint64_t jet_texture_Metal::get_width(id *this)
{
  return objc_msgSend(this[1], "width");
}

uint64_t jet_texture_Metal::get_height(id *this)
{
  return objc_msgSend(this[1], "height");
}

uint64_t jet_texture_Metal::get_depth(id *this)
{
  return objc_msgSend(this[1], "depth");
}

uint64_t jet_texture_Metal::get_type(jet_texture_Metal *this)
{
  return *((unsigned int *)this + 9);
}

uint64_t jet_texture_Metal::get_format(jet_texture_Metal *this)
{
  return *((unsigned int *)this + 8);
}

BOOL jet_texture_Metal::get_mip_mapped(id *this)
{
  return (unint64_t)objc_msgSend(this[1], "mipmapLevelCount") > 1;
}

uint64_t jet_texture_Metal::get_slice_count(jet_texture_Metal *this)
{
  return *((unsigned int *)this + 11);
}

uint64_t jet_texture_Metal::set_data(jet_texture_Metal *this, const void *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v10;
  unsigned int v11;

  v10 = (**(uint64_t (***)(jet_texture_Metal *))this)(this);
  v11 = (*(uint64_t (**)(jet_texture_Metal *))(*(_QWORD *)this + 8))(this);
  return (*(uint64_t (**)(jet_texture_Metal *, const void *, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)this + 64))(this, a2, a3, a4, 0, 0, 0, v10, v11 | 0x100000000, a5);
}

uint64_t jet_texture_Metal::replace_region(jet_texture_Metal *this, const void *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, unsigned int a11, unsigned int a12)
{
  uint64_t result;
  unsigned int bytes_per_row;
  unsigned int v22;
  void *v23;
  _QWORD v24[6];

  result = (*(uint64_t (**)(jet_texture_Metal *))(*(_QWORD *)this + 88))(this);
  if ((_DWORD)result)
    jet_texture_Metal::replace_region();
  if (a2)
  {
    bytes_per_row = a11;
    v22 = a12;
    if (!a11)
      bytes_per_row = jet_texture::get_bytes_per_row(this);
    if (!a12)
      v22 = (*(uint64_t (**)(jet_texture_Metal *))(*(_QWORD *)this + 8))(this) * bytes_per_row;
    v23 = (void *)*((_QWORD *)this + 1);
    v24[0] = a5;
    v24[1] = a6;
    v24[2] = a7;
    v24[3] = a8;
    v24[4] = a9;
    v24[5] = a10;
    return objc_msgSend(v23, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v24, a3, a4, a2, bytes_per_row, v22);
  }
  return result;
}

uint64_t jet_texture_Metal::copy_data(jet_texture_Metal *this, void *a2, unsigned int a3, unsigned int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t bytes_per_row;
  int v13;
  int v14;
  _QWORD v16[6];

  v8 = (**(unsigned int (***)(jet_texture_Metal *))this)(this);
  v9 = (*(unsigned int (**)(jet_texture_Metal *))(*(_QWORD *)this + 8))(this);
  v10 = (*(unsigned int (**)(jet_texture_Metal *))(*(_QWORD *)this + 16))(this);
  v11 = (void *)*((_QWORD *)this + 1);
  bytes_per_row = jet_texture::get_bytes_per_row(this);
  v13 = jet_texture::get_bytes_per_row(this);
  v14 = (*(uint64_t (**)(jet_texture_Metal *))(*(_QWORD *)this + 8))(this);
  memset(v16, 0, 24);
  v16[3] = v8;
  v16[4] = v9;
  v16[5] = v10;
  return objc_msgSend(v11, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a2, bytes_per_row, (v14 * v13), v16, a3, a4);
}

uint64_t jet_texture_Metal::generate_mip_map(jet_texture_Metal *this)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!*((_QWORD *)this + 1)
    || ((*(uint64_t (**)(jet_texture_Metal *))(*(_QWORD *)this + 88))(this) & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(*((id *)this + 1), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newCommandQueue");

  jet_getClientLabel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  objc_msgSend(v4, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blitCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateMipmapsForTexture:", *((_QWORD *)this + 1));
  objc_msgSend(v7, "endEncoding");
  objc_msgSend(v6, "commit");

  return 1;
}

void sub_2144D9228(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL jet_texture_Metal::is_framebuffer_only(id *this)
{
  return jet_texture::is_framebuffer_only((jet_texture *)this)
      || (objc_msgSend(this[1], "isFramebufferOnly") & 1) != 0
      || this[2] != 0;
}

uint64_t jet_texture_Metal::is_color_attachment_compatible(jet_texture_Metal *this)
{
  if (*((_BYTE *)this + 40))
    return 0;
  else
    return jet_texture::is_color_attachment_compatible(this);
}

BOOL jet_texture_Metal::is_depth_attachment_compatible(jet_texture_Metal *this)
{
  return !*((_BYTE *)this + 40) && jet_texture::is_depth_attachment_compatible(this);
}

BOOL jet_texture_Metal::is_stencil_attachment_compatible(jet_texture_Metal *this)
{
  return !*((_BYTE *)this + 40) && jet_texture::is_stencil_attachment_compatible(this);
}

void jet_texture_Metal::~jet_texture_Metal(jet_texture_Metal *this)
{
  jet_texture_Metal::~jet_texture_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = off_24D1A4470;
  *((_QWORD *)this + 1) = 0;

  v3 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;

  v4 = (void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;

  jet_texture::~jet_texture(this);
}

uint64_t jet_texture::get_bytes_per_row(jet_texture *this)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  int v5;

  v2 = (*(uint64_t (**)(jet_texture *))(*(_QWORD *)this + 32))(this) - 7;
  if (v2 > 6)
    v3 = 1;
  else
    v3 = dword_2144DE340[v2];
  v4 = (*(uint64_t (**)(jet_texture *))(*(_QWORD *)this + 32))(this) - 1;
  if (v4 > 0xC)
    v5 = 4;
  else
    v5 = dword_2144DE35C[v4];
  return v5 * v3 * (**(unsigned int (***)(jet_texture *))this)(this);
}

void jet_sampler_Metal::~jet_sampler_Metal(id *this)
{

  jet_sampler::~jet_sampler((jet_sampler *)this);
}

{

  jet_sampler::~jet_sampler((jet_sampler *)this);
  JUMPOUT(0x2199CF8ACLL);
}

void jet_function_Metal::~jet_function_Metal(jet_function_Metal *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_24D1A4540;
  *((_QWORD *)this + 1) = 0;

}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_24D1A4540;
  *((_QWORD *)this + 1) = 0;

  JUMPOUT(0x2199CF8ACLL);
}

void jet_program_Metal::~jet_program_Metal(jet_program_Metal *this)
{
  jet_program_Metal::~jet_program_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_24D1A4578;
  v2 = (void *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;

  v3 = (void *)*((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;

  jet_program::~jet_program(this);
}

void jet_render_mode_Metal::~jet_render_mode_Metal(jet_render_mode_Metal *this)
{
  jet_render_mode_Metal::~jet_render_mode_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;

  *(_QWORD *)this = &off_24D1A45B0;
  v2 = (void *)*((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 96);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 56);

  jet_render_mode::~jet_render_mode(this);
}

uint64_t jet_render_mode_Metal::get_vertex_buffer_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *v2;

  v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)(a1 + 56), a2);
  if (v2)
    return *((unsigned int *)v2 + 10);
  else
    return 0xFFFFFFFFLL;
}

uint64_t jet_render_mode_Metal::get_vertex_constant_index(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
}

uint64_t jet_render_mode_Metal::get_vertex_texture_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *v2;

  v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)(a1 + 56), a2);
  if (v2)
    return *((unsigned int *)v2 + 10);
  else
    return 0xFFFFFFFFLL;
}

uint64_t jet_render_mode_Metal::get_vertex_sampler_index(uint64_t a1, const void **a2)
{
  size_t v4;
  void **v5;
  const void *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *__p[2];
  char v11;

  if (*((char *)a2 + 23) >= 0)
    v4 = *((unsigned __int8 *)a2 + 23);
  else
    v4 = (size_t)a2[1];
  v5 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v4 + 8);
  if (v11 < 0)
    v5 = (void **)__p[0];
  if (v4)
  {
    if (*((char *)a2 + 23) >= 0)
      v6 = a2;
    else
      v6 = *a2;
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, "_sampler");
  v7 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)(a1 + 56), (unsigned __int8 *)__p);
  if (v7)
    v8 = *((unsigned int *)v7 + 10);
  else
    v8 = 0xFFFFFFFFLL;
  if (v11 < 0)
    operator delete(__p[0]);
  return v8;
}

void sub_2144D96C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t jet_render_mode_Metal::get_fragment_constant_index(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
}

uint64_t jet_render_mode_Metal::get_fragment_texture_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *v2;

  v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)(a1 + 96), a2);
  if (v2)
    return *((unsigned int *)v2 + 10);
  else
    return 0xFFFFFFFFLL;
}

uint64_t jet_render_mode_Metal::get_fragment_sampler_index(uint64_t a1, const void **a2)
{
  size_t v4;
  void **v5;
  const void *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *__p[2];
  char v11;

  if (*((char *)a2 + 23) >= 0)
    v4 = *((unsigned __int8 *)a2 + 23);
  else
    v4 = (size_t)a2[1];
  v5 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v4 + 8);
  if (v11 < 0)
    v5 = (void **)__p[0];
  if (v4)
  {
    if (*((char *)a2 + 23) >= 0)
      v6 = a2;
    else
      v6 = *a2;
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, "_sampler");
  v7 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)(a1 + 96), (unsigned __int8 *)__p);
  if (v7)
    v8 = *((unsigned int *)v7 + 10);
  else
    v8 = 0xFFFFFFFFLL;
  if (v11 < 0)
    operator delete(__p[0]);
  return v8;
}

void sub_2144D97E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t jet_render_mode_Metal::clone(jet_render_mode_Metal *this)
{
  uint64_t v2;

  v2 = operator new();
  *(_OWORD *)(v2 + 8) = *(_OWORD *)((char *)this + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)((char *)this + 24);
  *(_QWORD *)v2 = &off_24D1A45B0;
  *(_QWORD *)(v2 + 40) = *((id *)this + 5);
  *(_QWORD *)(v2 + 48) = *((id *)this + 6);
  std::unordered_map<std::string,int>::unordered_map(v2 + 56, (uint64_t)this + 56);
  std::unordered_map<std::string,int>::unordered_map(v2 + 96, (uint64_t)this + 96);
  return v2;
}

void sub_2144D9894(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(v2);

  jet_render_mode::~jet_render_mode((jet_render_mode *)v1);
  MEMORY[0x2199CF8AC]();
  _Unwind_Resume(a1);
}

uint64_t jet_render_mode_Metal::get_fragment_buffer_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *v2;

  v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)(a1 + 96), a2);
  if (v2)
    return *((unsigned int *)v2 + 10);
  else
    return 0xFFFFFFFFLL;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t std::unordered_map<std::string,int>::unordered_map(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_2144DA104(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_2144DA374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  *((_DWORD *)v8 + 10) = *(_DWORD *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_2144DA424(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  void **v14;
  void *i;
  unint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(void **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, (unsigned __int8 *)i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v10;
  v18 = *a4;
  v19 = **a4;
  *((_QWORD *)i + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  *((_DWORD *)i + 10) = 0;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)i = *v27;
LABEL_38:
    *v27 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v17;
  *v17 = i;
  *(_QWORD *)(v26 + 8 * v4) = v17;
  if (*(_QWORD *)i)
  {
    v28 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11)
        v28 %= v11;
    }
    else
    {
      v28 &= v11 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v8;
  return i;
}

void sub_2144DA6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void jet_stencil_mode_Metal::~jet_stencil_mode_Metal(jet_stencil_mode_Metal *this)
{
  jet_stencil_mode_Metal::~jet_stencil_mode_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_24D1A4630;
  *((_QWORD *)this + 1) = 0;

  jet_stencil_mode::~jet_stencil_mode(this);
}

void jet_depth_stencil_mode_Metal::~jet_depth_stencil_mode_Metal(jet_depth_stencil_mode_Metal *this)
{
  jet_depth_stencil_mode_Metal::~jet_depth_stencil_mode_Metal(this);
  JUMPOUT(0x2199CF8ACLL);
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_24D1A4668;
  *((_QWORD *)this + 1) = 0;

  jet_depth_stencil_mode::~jet_depth_stencil_mode(this);
}

BOOL jet_fence_Metal::is_finished(jet_fence_Metal *this)
{
  _BOOL8 result;

  if (objc_msgSend(*((id *)this + 2), "status") != 4)
    return *((_BYTE *)this + 8) != 0;
  result = 1;
  *((_BYTE *)this + 8) = 1;
  return result;
}

uint64_t jet_fence_Metal::wait(id *this)
{
  if (!*((_BYTE *)this + 8))
  {
    objc_msgSend(this[2], "waitUntilCompleted");
    *((_BYTE *)this + 8) = 1;
  }
  return 1;
}

void jet_fence_Metal::~jet_fence_Metal(id *this)
{

  jet_fence::~jet_fence((jet_fence *)this);
}

{

  jet_fence::~jet_fence((jet_fence *)this);
  JUMPOUT(0x2199CF8ACLL);
}

_QWORD *std::shared_ptr<jet_fence_Metal>::shared_ptr[abi:ne180100]<jet_fence_Metal,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24D1A46E8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2144DA918(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<jet_fence_Metal *,std::shared_ptr<jet_fence_Metal>::__shared_ptr_default_delete<jet_fence_Metal,jet_fence_Metal>,std::allocator<jet_fence_Metal>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t std::__shared_ptr_pointer<jet_fence_Metal *,std::shared_ptr<jet_fence_Metal>::__shared_ptr_default_delete<jet_fence_Metal,jet_fence_Metal>,std::allocator<jet_fence_Metal>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<jet_fence_Metal *,std::shared_ptr<jet_fence_Metal>::__shared_ptr_default_delete<jet_fence_Metal,jet_fence_Metal>,std::allocator<jet_fence_Metal>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void jet_stencil_mode::jet_stencil_mode(jet_stencil_mode *this)
{
  *(_QWORD *)this = &off_24D1A4760;
}

{
  *(_QWORD *)this = &off_24D1A4760;
}

void jet_stencil_mode::~jet_stencil_mode(jet_stencil_mode *this)
{
  JUMPOUT(0x2199CF8ACLL);
}

void jet_depth_stencil_mode::jet_depth_stencil_mode(jet_depth_stencil_mode *this)
{
  *(_QWORD *)this = &off_24D1A4780;
}

{
  *(_QWORD *)this = &off_24D1A4780;
}

void jet_depth_stencil_mode::~jet_depth_stencil_mode(jet_depth_stencil_mode *this)
{
  JUMPOUT(0x2199CF8ACLL);
}

uint64_t jet_isOpenGLSupported(void)
{
  return 1;
}

uint64_t jet_isMetalSupported(void)
{
  if (jet_isMetalSupported(void)::onceToken != -1)
    dispatch_once(&jet_isMetalSupported(void)::onceToken, &__block_literal_global);
  return jet_isMetalSupported(void)::_isMetalSupported;
}

void ___Z20jet_isMetalSupportedv_block_invoke()
{
  void *v0;

  jet_choose_Metal_Device();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
    jet_isMetalSupported(void)::_isMetalSupported = 1;

}

jet_context_OpenGL *jet_createSharedContext(jet_context *a1)
{
  void *v2;
  jet_context_OpenGL *v3;
  EAGLContext *v4;
  void *v6;
  EAGLContext *v7;

  if (!a1)
    return jet_createContext();
  if ((*(unsigned int (**)(jet_context *))(*(_QWORD *)a1 + 136))(a1) == 1)
  {
    v3 = (jet_context_OpenGL *)operator new();
    (*(void (**)(void *))(*(_QWORD *)v2 + 360))(v2);
    v4 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
    jet_context_Metal::jet_context_Metal(v3, v4);
  }
  else
  {
    if ((*(unsigned int (**)(jet_context *))(*(_QWORD *)a1 + 136))(a1))
      jet_createSharedContext();
    (*(void (**)(void *))(*(_QWORD *)v6 + 360))(v6);
    v4 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
    v3 = (jet_context_OpenGL *)operator new();
    jet_createGLContext(v4);
    v7 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
    jet_context_OpenGL::jet_context_OpenGL(v3, v7);

  }
  return v3;
}

void sub_2144DABDC(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  MEMORY[0x2199CF8AC](v1, 0x10A1C40A090A19DLL);
  _Unwind_Resume(a1);
}

jet_context_OpenGL *jet_createContext(void)
{
  jet_context_OpenGL *v0;

  if (jet_isMetalSupported(void)::onceToken != -1)
    dispatch_once(&jet_isMetalSupported(void)::onceToken, &__block_literal_global);
  if (jet_isMetalSupported(void)::_isMetalSupported == 1)
  {
    v0 = (jet_context_OpenGL *)operator new();
    jet_context_Metal::jet_context_Metal(v0, 0);
  }
  else
  {
    v0 = (jet_context_OpenGL *)operator new();
    jet_context_OpenGL::jet_context_OpenGL(v0, 0);
  }
  return v0;
}

void sub_2144DACE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199CF8AC](v1, 0x10A1C40A090A19DLL);
  _Unwind_Resume(a1);
}

void jet_ensureClientLabel(void)
{
  if (jet_ensureClientLabel(void)::onceToken != -1)
    dispatch_once(&jet_ensureClientLabel(void)::onceToken, &__block_literal_global_3);
}

void ___Z21jet_ensureClientLabelv_block_invoke()
{
  void *v0;

  v0 = (void *)_clientLabel;
  _clientLabel = (uint64_t)CFSTR("com.apple.Jet");

}

void jet_setClientLabel(NSString *a1)
{
  NSString *v1;
  void *v2;

  v1 = a1;
  if (jet_ensureClientLabel(void)::onceToken != -1)
    dispatch_once(&jet_ensureClientLabel(void)::onceToken, &__block_literal_global_3);
  v2 = (void *)_clientLabel;
  _clientLabel = (uint64_t)v1;

}

id jet_getClientLabel(void)
{
  if (jet_ensureClientLabel(void)::onceToken != -1)
    dispatch_once(&jet_ensureClientLabel(void)::onceToken, &__block_literal_global_3);
  return (id)_clientLabel;
}

id jet_get_debug_options(void)
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryForKey:", CFSTR("JetDefaults"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

void sub_2144DAE74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t jet_get_info_plist_flag_is_set(NSString *a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

void sub_2144DAF38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL jet_util_isPOT(unsigned int a1, unsigned int a2)
{
  int32x2_t v2;
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    v2 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(a1, a2), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(a1, a2), (int32x2_t)-1)));
    if ((v2.i8[4] & 1) != 0 && a2 && (v2.i8[0] & 1) != 0)
      return 1;
  }
  return result;
}

BOOL jet_texture_format_is_framebuffer_only(int a1)
{
  return (a1 - 11) < 3;
}

void jet_log(NSString *a1, ...)
{
  NSString *v1;
  NSString *v2;
  NSString *v3;
  va_list va;

  va_start(va, a1);
  v1 = a1;
  if (v1)
  {
    v2 = v1;
    objc_msgSend(CFSTR("Jet: "), "stringByAppendingString:", v1);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    NSLogv(v3, va);
  }
}

void sub_2144DB024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void jet_assert(char a1, NSString *a2)
{
  NSString *v3;

  v3 = a2;
  if (v3 && (a1 & 1) == 0)
    jet_log(CFSTR("%@"), v3);
  if ((a1 & 1) == 0)
    __assert_rtn("jet_assert", "jet_utils.mm", 75, "value");

}

void sub_2144DB0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL jet_debug_option_exists(NSString *a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  jet_get_debug_options();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void sub_2144DB120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t jet_debug_option_get_BOOL(NSString *a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  jet_get_debug_options();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

void sub_2144DB1A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t jet_debug_option_get_int(NSString *a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  jet_get_debug_options();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

void sub_2144DB240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id jet_debug_option_get_string(NSString *a1)
{
  NSString *v1;
  void *v2;
  void *v3;

  v1 = a1;
  jet_get_debug_options();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_2144DB2BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t jet_Metal_Device_is_supported()
{
  return 1;
}

id jet_choose_Metal_Device(void)
{
  return MTLCreateSystemDefaultDevice();
}

uint64_t jet_buffer_pool::jet_buffer_pool(uint64_t result, int a2, int a3, int a4)
{
  *(_QWORD *)result = &off_24D1A4820;
  *(_DWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(_QWORD *)(result + 24) = result + 24;
  *(_QWORD *)(result + 32) = result + 24;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_DWORD *)(result + 56) = 3;
  return result;
}

_QWORD *jet_buffer_pool::initialize_first_buffer(jet_buffer_pool *this)
{
  jet_buffer_pool *v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;

  v1 = this;
  v2 = (*(uint64_t (**)(jet_buffer_pool *))(*(_QWORD *)this + 24))(this);
  result = operator new(0x18uLL);
  v4 = *((_QWORD *)v1 + 3);
  v1 = (jet_buffer_pool *)((char *)v1 + 24);
  result[1] = v1;
  result[2] = v2;
  *result = v4;
  *(_QWORD *)(v4 + 8) = result;
  *(_QWORD *)v1 = result;
  v5 = *((_QWORD *)v1 + 1);
  ++*((_QWORD *)v1 + 2);
  *((_QWORD *)v1 + 3) = v5;
  return result;
}

uint64_t jet_buffer_pool::get_length(jet_buffer_pool *this)
{
  return (***(uint64_t (****)(_QWORD))(*((_QWORD *)this + 6) + 16))(*(_QWORD *)(*((_QWORD *)this + 6) + 16));
}

uint64_t jet_buffer_pool::get_current_buffer(jet_buffer_pool *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 6) + 16);
}

uint64_t jet_buffer_pool::is_finished(jet_buffer_pool *this)
{
  return jet_buffer::is_finished(*(jet_buffer **)(*((_QWORD *)this + 6) + 16));
}

uint64_t jet_buffer_pool::wait(jet_buffer_pool *this)
{
  return jet_buffer::wait(*(dispatch_semaphore_t **)(*((_QWORD *)this + 6) + 16));
}

uint64_t jet_buffer_pool::set_data(jet_buffer_pool *this, const void *a2)
{
  return (*(uint64_t (**)(_QWORD, const void *))(**(_QWORD **)(*((_QWORD *)this + 6) + 16) + 8))(*(_QWORD *)(*((_QWORD *)this + 6) + 16), a2);
}

uint64_t jet_buffer_pool::get_data(jet_buffer_pool *this)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)this + 6) + 16) + 16))(*(_QWORD *)(*((_QWORD *)this + 6) + 16));
}

uint64_t jet_buffer_pool::commit_data(jet_buffer_pool *this)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)this + 6) + 16) + 24))(*(_QWORD *)(*((_QWORD *)this + 6) + 16));
}

uint64_t jet_buffer_pool::resize(uint64_t this, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(this + 16) = a2;
  v2 = *(_QWORD *)(this + 48);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    this = jet_buffer::is_finished(*(jet_buffer **)(v2 + 16));
    if ((_DWORD)this)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 32))(v3, a2);
  }
  return this;
}

uint64_t jet_buffer_pool::next_buffer(jet_buffer_pool *this, int a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;

  v4 = *(_QWORD **)(*((_QWORD *)this + 6) + 8);
  *((_QWORD *)this + 6) = v4;
  if (v4 == (_QWORD *)((char *)this + 24))
  {
    v4 = (_QWORD *)*((_QWORD *)this + 4);
    *((_QWORD *)this + 6) = v4;
  }
  v5 = v4[2];
  if ((jet_buffer::is_finished((jet_buffer *)v5) & 1) == 0)
  {
    if (*((_QWORD *)this + 5) >= (unint64_t)*((unsigned int *)this + 14))
    {
      if (a2)
        jet_buffer::wait((dispatch_semaphore_t *)v5);
    }
    else
    {
      v5 = (*(uint64_t (**)(jet_buffer_pool *))(*(_QWORD *)this + 24))(this);
      v6 = (uint64_t *)*((_QWORD *)this + 6);
      v7 = operator new(0x18uLL);
      v7[2] = v5;
      v8 = *v6;
      *(_QWORD *)(v8 + 8) = v7;
      *v7 = v8;
      *v6 = (uint64_t)v7;
      v7[1] = v6;
      ++*((_QWORD *)this + 5);
      *((_QWORD *)this + 6) = v7;
    }
  }
  if (*(_DWORD *)(v5 + 48) != *((_DWORD *)this + 4))
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 32))(v5);
  return v5;
}

uint64_t jet_buffer_pool::get_max_buffer_count(jet_buffer_pool *this)
{
  return *((unsigned int *)this + 14);
}

uint64_t jet_buffer_pool::set_max_buffer_count(uint64_t this, unsigned int a2)
{
  if (*(_DWORD *)(this + 56) > a2)
    jet_buffer_pool::set_max_buffer_count();
  *(_DWORD *)(this + 56) = a2;
  return this;
}

void jet_buffer_pool::~jet_buffer_pool(jet_buffer_pool *this)
{
  _QWORD *v1;
  _QWORD *i;
  uint64_t v3;

  *(_QWORD *)this = &off_24D1A4820;
  v1 = (_QWORD *)((char *)this + 24);
  for (i = (_QWORD *)*((_QWORD *)this + 4); i != v1; i = (_QWORD *)i[1])
  {
    v3 = i[2];
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 48))(v3);
  }
  std::__list_imp<jet_buffer *>::clear(v1);
  std::__list_imp<jet_buffer *>::clear(v1);
}

_QWORD *std::__list_imp<jet_buffer *>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void jet_program::jet_program(jet_program *this)
{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = &off_24D1A4860;
  *((_QWORD *)this + 1) = (char *)this + 16;
}

{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = &off_24D1A4860;
  *((_QWORD *)this + 1) = (char *)this + 16;
}

void jet_program::~jet_program(jet_program *this)
{
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  BOOL v8;

  *(_QWORD *)this = &off_24D1A4860;
  v2 = (char *)this + 16;
  v3 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (v4 != (char *)this + 16)
  {
    do
    {
      v5 = *((_QWORD *)v4 + 7);
      if (v5)
        (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      v6 = (char *)*((_QWORD *)v4 + 1);
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (char *)*((_QWORD *)v4 + 2);
          v8 = *(_QWORD *)v7 == (_QWORD)v4;
          v4 = v7;
        }
        while (!v8);
      }
      v4 = v7;
    }
    while (v7 != v2);
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)v3, *((_QWORD **)this + 2));
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 1) = v2;
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)v3, 0);
}

{
  jet_program::~jet_program(this);
  JUMPOUT(0x2199CF8ACLL);
}

__n128 jet_framebuffer::clone(jet_framebuffer *this)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;

  v2 = operator new();
  *(_QWORD *)v2 = &off_24D1A4890;
  v3 = *((_OWORD *)this + 14);
  *(_OWORD *)(v2 + 208) = *((_OWORD *)this + 13);
  *(_OWORD *)(v2 + 224) = v3;
  *(_OWORD *)(v2 + 240) = *((_OWORD *)this + 15);
  v4 = *((_OWORD *)this + 10);
  *(_OWORD *)(v2 + 144) = *((_OWORD *)this + 9);
  *(_OWORD *)(v2 + 160) = v4;
  v5 = *((_OWORD *)this + 12);
  *(_OWORD *)(v2 + 176) = *((_OWORD *)this + 11);
  *(_OWORD *)(v2 + 192) = v5;
  v6 = *((_OWORD *)this + 6);
  *(_OWORD *)(v2 + 80) = *((_OWORD *)this + 5);
  *(_OWORD *)(v2 + 96) = v6;
  v7 = *((_OWORD *)this + 8);
  *(_OWORD *)(v2 + 112) = *((_OWORD *)this + 7);
  *(_OWORD *)(v2 + 128) = v7;
  v8 = *((_OWORD *)this + 2);
  *(_OWORD *)(v2 + 16) = *((_OWORD *)this + 1);
  *(_OWORD *)(v2 + 32) = v8;
  result = *((__n128 *)this + 4);
  *(_OWORD *)(v2 + 48) = *((_OWORD *)this + 3);
  *(__n128 *)(v2 + 64) = result;
  return result;
}

void jet_framebuffer::~jet_framebuffer(jet_framebuffer *this)
{
  JUMPOUT(0x2199CF8ACLL);
}

void jet_texture::jet_texture(jet_texture *this)
{
  *(_QWORD *)this = &unk_24D1A48C8;
}

uint64_t jet_texture::is_color_attachment_compatible(jet_texture *this)
{
  unsigned int v1;

  v1 = (*(uint64_t (**)(jet_texture *))(*(_QWORD *)this + 32))(this);
  return (v1 < 0xF) & (0x469Eu >> v1);
}

BOOL jet_texture::is_depth_attachment_compatible(jet_texture *this)
{
  return (((*(unsigned int (**)(jet_texture *))(*(_QWORD *)this + 32))(this) - 11) & 0xFFFFFFFD) == 0;
}

BOOL jet_texture::is_stencil_attachment_compatible(jet_texture *this)
{
  return (*(unsigned int (**)(jet_texture *))(*(_QWORD *)this + 32))(this) - 11 < 2;
}

BOOL jet_texture::is_framebuffer_only(jet_texture *this)
{
  int v1;

  v1 = (*(uint64_t (**)(jet_texture *))(*(_QWORD *)this + 32))(this);
  return jet_texture_format_is_framebuffer_only(v1);
}

uint64_t floatToHalfFloat(float a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = HIWORD(LODWORD(a1)) & 0x8000;
  v2 = LODWORD(a1) & 0x7F800000;
  v3 = LODWORD(a1) & 0x7FFFFF;
  if ((LODWORD(a1) >> 23) < 0x8Fu)
  {
    v4 = v1 | (((v2 + 0x8000000) | v3) >> 13);
    v1 |= v3 >> (((939524096 - v2) >> 23) + 14);
    if (v2 > 0x38000000)
      LOWORD(v1) = v4;
  }
  else if (v3 && v2 == 2139095040)
  {
    LOWORD(v1) = HIWORD(a1) | 0x7FFF;
  }
  else
  {
    LOWORD(v1) = v1 | 0x7C00;
  }
  return (unsigned __int16)v1;
}

void jet_convert_pixel_data_rgba_fp32_to_rgb32_101010_a8(char *a1, int *a2, _BYTE *a3, int a4, int a5)
{
  int *v5;
  _BYTE *v6;
  int v7;
  float *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;

  if (a4)
  {
    if (a1)
    {
      v5 = a2;
      if (a2)
      {
        v6 = a3;
        if (a3)
        {
          if (a5)
          {
            v7 = a5 * a4;
            if (a5 * a4)
            {
              v8 = (float *)(a1 + 12);
              do
              {
                v9 = *(v8 - 1);
                v10 = v9;
                if (v9 < 0.0)
                  v10 = -v9;
                if (v10 <= 0.003131)
                  v11 = v10 * 12.92;
                else
                  v11 = pow(v10, 0.416666667) * 1.055 + -0.055;
                v12 = -v11;
                if (v9 >= 0.0)
                  v12 = v11;
                v13 = -0.752941;
                if (v12 >= -0.752941)
                {
                  v13 = v12;
                  if (v12 > 1.252941)
                    v13 = 1.252941;
                }
                *v5++ = ((unsigned __int16)llround(v13 * 510.0) + 384) & 0x3FF;
                v14 = *v8;
                v8 += 4;
                *v6++ = (int)(float)(v14 * 255.0);
                --v7;
              }
              while (v7);
            }
          }
        }
      }
    }
  }
}

uint64_t jet_convert_pixel_data_rgba_fp32_to_rgba_fp16(uint64_t result, _WORD *a2, int a3, int a4)
{
  _WORD *v4;
  int v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  if (result)
  {
    v4 = a2;
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          v5 = a4 * a3;
          if (a4 * a3)
          {
            v6 = result;
            do
            {
              v7 = -0.75294;
              if (*(float *)v6 >= -0.75294)
              {
                v7 = *(float *)v6;
                if (*(float *)v6 > 1.2529)
                  v7 = 1.2529;
              }
              *v4 = floatToHalfFloat(v7);
              v8 = *(float *)(v6 + 4);
              v9 = -0.75294;
              if (v8 >= -0.75294)
              {
                v9 = *(float *)(v6 + 4);
                if (v8 > 1.2529)
                  v9 = 1.2529;
              }
              v4[1] = floatToHalfFloat(v9);
              v10 = *(float *)(v6 + 8);
              v11 = -0.75294;
              if (v10 >= -0.75294)
              {
                v11 = *(float *)(v6 + 8);
                if (v10 > 1.2529)
                  v11 = 1.2529;
              }
              v4[2] = floatToHalfFloat(v11);
              v12 = *(float *)(v6 + 12);
              v13 = -0.75294;
              if (v12 >= -0.75294)
              {
                v13 = *(float *)(v6 + 12);
                if (v12 > 1.2529)
                  v13 = 1.2529;
              }
              result = floatToHalfFloat(v13);
              v4[3] = result;
              v6 += 16;
              v4 += 4;
              --v5;
            }
            while (v5);
          }
        }
      }
    }
  }
  return result;
}

float *jet_convert_pixel_data_rgba_fp32_to_argb64_xr10_srgb(float *result, unint64_t *a2, int a3, int a4)
{
  int i;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (i = a4 * a3; i; --i)
          {
            v5 = *result;
            v6 = -0.752941;
            if (v5 >= -0.752941)
            {
              v6 = *result;
              if (v5 > 1.252941)
                v6 = 1.252941;
            }
            v7 = result[1];
            v8 = -0.752941;
            if (v7 >= -0.752941)
            {
              v8 = result[1];
              if (v7 > 1.252941)
                v8 = 1.252941;
            }
            v9 = result[2];
            v10 = -0.752941;
            if (v9 >= -0.752941)
            {
              v10 = result[2];
              if (v9 > 1.252941)
                v10 = 1.252941;
            }
            v11 = result[3];
            v12 = -0.752941;
            if (v11 >= -0.752941)
            {
              v12 = result[3];
              if (v11 > 1.252941)
                v12 = 1.252941;
            }
            *a2++ = (unsigned __int16)(((unsigned __int16)llround(v10 * 510.0) << 6) + 24576) & 0xFFC0 | ((unint64_t)(((unsigned __int16)llround(v6 * 510.0) + 384) & 0x3FF) << 38) | ((llround(v8 * 510.0) << 22) + 1610612736) | ((unint64_t)(llround(v12 * 510.0) + 384) << 54);
            result += 4;
          }
        }
      }
    }
  }
  return result;
}

char *jet_convert_pixel_data_rgba_5551_to_rgba_8888(char *result, char *a2, int a3, int a4)
{
  int i;
  char v5;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (i = a4 * a3; i; --i)
          {
            *a2 = (2156535 * (*(unsigned __int16 *)result >> 11)) >> 18;
            a2[1] = (2156535 * ((*(unsigned __int16 *)result >> 6) & 0x1Fu)) >> 18;
            a2[2] = (2156535 * ((*(unsigned __int16 *)result >> 1) & 0x1Fu)) >> 18;
            v5 = *result;
            result += 2;
            a2[3] = -(v5 & 1);
            a2 += 4;
          }
        }
      }
    }
  }
  return result;
}

char *jet_convert_pixel_data_rgba_4444_to_rgba_8888(char *result, char *a2, int a3, int a4)
{
  int i;
  char v5;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (i = a4 * a3; i; --i)
          {
            *a2 = (*(unsigned __int16 *)result >> 12) | (16 * (*(unsigned __int16 *)result >> 12));
            a2[1] = result[1] & 0xF | (16 * result[1]);
            a2[2] = (*result >> 4) | (16 * (*result >> 4));
            v5 = *result;
            result += 2;
            a2[3] = v5 & 0xF | (16 * v5);
            a2 += 4;
          }
        }
      }
    }
  }
  return result;
}

unsigned __int16 *jet_convert_pixel_data_rgb_565_to_rgba_8888(unsigned __int16 *result, char *a2, int a3, int a4)
{
  int i;
  __int16 v5;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (i = a4 * a3; i; --i)
          {
            *a2 = (2156535 * (*result >> 11)) >> 18;
            a2[1] = (4244475 * ((*result >> 5) & 0x3Fu)) >> 20;
            v5 = *result++;
            a2[2] = (2156535 * (v5 & 0x1Fu)) >> 18;
            a2[3] = -1;
            a2 += 4;
          }
        }
      }
    }
  }
  return result;
}

uint64_t jet_convert_pixel_data_bgra_8888_to_rgba_8888(uint64_t result, char *a2, int a3, int a4)
{
  int v4;
  char *v5;
  char v6;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          v4 = a4 * a3;
          if (a4 * a3)
          {
            v5 = (char *)(result + 3);
            do
            {
              *a2 = *(v5 - 1);
              a2[1] = *(v5 - 2);
              a2[2] = *(v5 - 3);
              v6 = *v5;
              v5 += 4;
              a2[3] = v6;
              a2 += 4;
              --v4;
            }
            while (v4);
          }
        }
      }
    }
  }
  return result;
}

void jet_buffer::jet_buffer(jet_buffer *this)
{
  *(_QWORD *)this = &unk_24D1A4970;
  *((_BYTE *)this + 8) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_DWORD *)this + 22) = 1065353216;
}

uint64_t jet_buffer::is_finished(jet_buffer *this)
{
  uint64_t result;
  uint64_t (***v2)(_QWORD);
  _QWORD *v3;

  if (*((_BYTE *)this + 8))
    return 0;
  v3 = (_QWORD *)((char *)this + 24);
  v2 = (uint64_t (***)(_QWORD))*((_QWORD *)this + 3);
  if (v2)
  {
    result = (**v2)(v2);
    if (!(_DWORD)result)
      return result;
    std::shared_ptr<jet_fence>::reset[abi:ne180100](v3);
  }
  return 1;
}

uint64_t jet_buffer::wait(dispatch_semaphore_t *this)
{
  int v2;
  dispatch_semaphore_t v3;
  dispatch_semaphore_t v4;
  uint64_t result;
  dispatch_semaphore_t v6;
  _QWORD *v7;
  dispatch_semaphore_t v8;

  if ((jet_buffer::is_finished((jet_buffer *)this) & 1) != 0)
    return 1;
  if (*((_BYTE *)this + 8))
  {
    v2 = 1;
    do
    {
      while (this[3])
      {
        if (!v2)
          goto LABEL_8;
      }
      v3 = dispatch_semaphore_create(0);
      v4 = this[2];
      this[2] = v3;

      dispatch_semaphore_wait(this[2], 0xFFFFFFFFFFFFFFFFLL);
      v2 = *((unsigned __int8 *)this + 8);
    }
    while (*((_BYTE *)this + 8));
  }
LABEL_8:
  result = jet_buffer::is_finished((jet_buffer *)this);
  v8 = this[3];
  v7 = this + 3;
  v6 = v8;
  if (v8)
  {
    result = (*((uint64_t (**)(dispatch_semaphore_t))v6->isa + 1))(v6);
    if ((_DWORD)result)
    {
      std::shared_ptr<jet_fence>::reset[abi:ne180100](v7);
      return 1;
    }
  }
  return result;
}

void jet_buffer::~jet_buffer(dispatch_semaphore_t *this)
{
  _QWORD *i;
  _QWORD *v3;
  dispatch_semaphore_t *v4;

  *this = (dispatch_semaphore_t)&unk_24D1A4970;
  if (this[2])
  {
    while (dispatch_semaphore_signal(this[2]))
      ;
  }
  for (i = this[9]; i; i = (_QWORD *)*i)
  {
    v3 = (_QWORD *)i[2];
    v4 = this;
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>(v3, &v4);
  }
  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::~__hash_table((uint64_t)(this + 7));
  std::shared_ptr<jet_fence>::~shared_ptr[abi:ne180100]((uint64_t)(this + 3));

}

void xglProgram::xglProgram(xglProgram *this, GLchar *a2, GLchar *a3, EAGLContext *a4)
{
  EAGLContext *v7;
  EAGLContext *v8;
  uint64_t v9;
  void *v10;
  GLuint v11;
  GLuint Program;
  const char *v13;
  int v14;
  GLuint shader[2];
  _BYTE v16[16];

  v7 = a4;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 6) = (char *)this + 56;
  *((_QWORD *)this + 1) = v7;
  *((_DWORD *)this + 4) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 3) = (char *)this + 32;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 8) = 0;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v9;

    v8 = (EAGLContext *)*((_QWORD *)this + 1);
  }
  glContextUse::glContextUse((glContextUse *)v16, v8);
  *(_QWORD *)shader = 0;
  *((_DWORD *)this + 4) = glCreateProgram();
  if (!xglCompileShader(&shader[1], 35633, a2, 0))
  {
    v13 = "xglCompileShader(&vertexShaderId, GL_VERTEX_SHADER, vertexShaderSource)";
    v14 = 34;
    goto LABEL_11;
  }
  if (!xglCompileShader(shader, 35632, a3, 0))
  {
    v13 = "xglCompileShader(&fragmentShaderId, GL_FRAGMENT_SHADER, fragmentShaderSource)";
    v14 = 35;
LABEL_11:
    __assert_rtn("xglProgram", "xglProgram.mm", v14, v13);
  }
  v11 = shader[1];
  if (shader[1] && shader[0])
  {
    Program = glCreateProgram();
    *((_DWORD *)this + 4) = Program;
    glAttachShader(Program, shader[1]);
    glAttachShader(*((_DWORD *)this + 4), shader[0]);
    xglLinkProgram(*((_DWORD *)this + 4));
    glDetachShader(*((_DWORD *)this + 4), shader[1]);
    glDetachShader(*((_DWORD *)this + 4), shader[0]);
    v11 = shader[1];
  }
  glDeleteShader(v11);
  glDeleteShader(shader[0]);
  glContextUse::~glContextUse((glContextUse *)v16);

}

void sub_2144DC13C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v3, *(char **)(v1 + 56));
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v4, *(char **)(v1 + 32));

  _Unwind_Resume(a1);
}

void xglProgram::xglProgram(xglProgram *this, GLuint a2, GLuint a3, EAGLContext *a4)
{
  EAGLContext *v7;
  EAGLContext *v8;
  EAGLContext *v9;
  uint64_t v10;
  void *v11;
  GLuint Program;
  _BYTE v13[16];

  v7 = a4;
  *(_BYTE *)this = 0;
  v8 = v7;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 6) = (char *)this + 56;
  *((_QWORD *)this + 1) = v8;
  *((_DWORD *)this + 4) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 3) = (char *)this + 32;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 8) = 0;
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v10;

    v9 = (EAGLContext *)*((_QWORD *)this + 1);
  }
  glContextUse::glContextUse((glContextUse *)v13, v9);
  if (a2 && a3)
  {
    Program = glCreateProgram();
    *((_DWORD *)this + 4) = Program;
    glAttachShader(Program, a2);
    glAttachShader(*((_DWORD *)this + 4), a3);
    xglLinkProgram(*((_DWORD *)this + 4));
    glDetachShader(*((_DWORD *)this + 4), a2);
    glDetachShader(*((_DWORD *)this + 4), a3);
  }
  glContextUse::~glContextUse((glContextUse *)v13);

}

void sub_2144DC284(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v3, *(char **)(v1 + 56));
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v4, *(char **)(v1 + 32));

  _Unwind_Resume(a1);
}

void xglProgram::~xglProgram(xglProgram *this)
{
  _BYTE v2[16];

  glContextUse::glContextUse((glContextUse *)v2, *((EAGLContext **)this + 1));
  glDeleteProgram(*((_DWORD *)this + 4));
  *((_DWORD *)this + 4) = 0;
  glContextUse::~glContextUse((glContextUse *)v2);
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy((uint64_t)this + 48, *((char **)this + 7));
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy((uint64_t)this + 24, *((char **)this + 4));

}

uint64_t xglProgram::getAttributeIndex(xglProgram *this, char *a2)
{
  unsigned int *v4;
  uint64_t AttribLocation;
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v4 = (unsigned int *)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>((uint64_t)this + 48, (const void **)__p);
  if ((unsigned int *)((char *)this + 56) == v4)
    AttribLocation = glGetAttribLocation(*((_DWORD *)this + 4), a2);
  else
    AttribLocation = v4[14];
  if (v8 < 0)
    operator delete(__p[0]);
  return AttribLocation;
}

void sub_2144DC3B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t xglProgram::getUniformLocation(xglProgram *this, char *a2)
{
  uint64_t **v4;
  unsigned int *v5;
  uint64_t UniformLocation;
  void *__p[2];
  char v9;
  void *v10[2];
  char v11;
  void **v12;

  std::string::basic_string[abi:ne180100]<0>(v10, a2);
  v4 = (uint64_t **)((char *)this + 24);
  v5 = (unsigned int *)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>((uint64_t)this + 24, (const void **)v10);
  if ((unsigned int *)((char *)this + 32) == v5)
  {
    UniformLocation = glGetUniformLocation(*((_DWORD *)this + 4), a2);
    std::string::basic_string[abi:ne180100]<0>(__p, a2);
    v12 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (const void **)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v12)+ 14) = UniformLocation;
    if (v9 < 0)
      operator delete(__p[0]);
  }
  else
  {
    UniformLocation = v5[14];
  }
  if (v11 < 0)
    operator delete(v10[0]);
  return UniformLocation;
}

void sub_2144DC494(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform1i(UniformLocation, a3);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3, GLint a4)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform2i(UniformLocation, a3, a4);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3, GLint a4, GLint a5)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform3i(UniformLocation, a3, a4, a5);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3, GLint a4, GLint a5, GLint a6)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform4i(UniformLocation, a3, a4, a5, a6);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, int a3, const int *a4, GLsizei a5)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  switch(a3)
  {
    case 1:
      glUniform1iv(UniformLocation, a5, a4);
      break;
    case 2:
      glUniform2iv(UniformLocation, a5, a4);
      break;
    case 3:
      glUniform3iv(UniformLocation, a5, a4);
      break;
    case 4:
      glUniform4iv(UniformLocation, a5, a4);
      break;
    default:
      return;
  }
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform1f(UniformLocation, a3);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3, GLfloat a4)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform2f(UniformLocation, a3, a4);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3, GLfloat a4, GLfloat a5)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform3f(UniformLocation, a3, a4, a5);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3, GLfloat a4, GLfloat a5, GLfloat a6)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  glUniform4f(UniformLocation, a3, a4, a5, a6);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, int a3, const float *a4, GLsizei a5)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  switch(a3)
  {
    case 1:
      glUniform1fv(UniformLocation, a5, a4);
      break;
    case 2:
      glUniform2fv(UniformLocation, a5, a4);
      break;
    case 3:
      glUniform3fv(UniformLocation, a5, a4);
      break;
    case 4:
      glUniform4fv(UniformLocation, a5, a4);
      break;
    default:
      return;
  }
}

void xglProgram::setUniformMatrix(xglProgram *this, char *a2, int a3, const float *a4, GLsizei a5)
{
  GLint UniformLocation;

  UniformLocation = xglProgram::getUniformLocation(this, a2);
  switch(a3)
  {
    case 4:
      glUniformMatrix4fv(UniformLocation, a5, 0, a4);
      break;
    case 3:
      glUniformMatrix3fv(UniformLocation, a5, 0, a4);
      break;
    case 2:
      glUniformMatrix2fv(UniformLocation, a5, 0, a4);
      break;
  }
}

BOOL xglProgram::validate(xglProgram *this)
{
  return xglValidateProgram(*((_DWORD *)this + 4));
}

void xglProgram::use(xglProgram *this)
{
  glUseProgram(*((_DWORD *)this + 4));
}

void std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32)))
    return v2;
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

_OWORD *std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = (void **)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x40uLL);
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void jet_sampler::jet_sampler(jet_sampler *this)
{
  *(_QWORD *)this = &off_24D1A4A08;
}

{
  *(_QWORD *)this = &off_24D1A4A08;
}

void jet_sampler::~jet_sampler(jet_sampler *this)
{
  JUMPOUT(0x2199CF8ACLL);
}

void jet_constant::jet_constant(jet_constant *this)
{
  *(_QWORD *)this = &unk_24D1A4A38;
}

void xglAssertNoError()
{
  jet_log(CFSTR("GL_INVALID_FRAMEBUFFER_OPERATION\n"));
  xglPrintFramebufferStatus();
}

{
  __assert_rtn("xglAssertNoError", "xgl_utils.mm", 479, "code == GL_NO_ERROR");
}

void jet_context::set_vertex_texture()
{
  __assert_rtn("set_vertex_texture", "jet_context.mm", 359, "!texture->is_framebuffer_only()");
}

void jet_context::set_fragment_texture()
{
  __assert_rtn("set_fragment_texture", "jet_context.mm", 387, "!texture->is_framebuffer_only()");
}

void jet_context_OpenGL::create_texture()
{
  __assert_rtn("create_texture", "jet_context_OpenGL.mm", 381, "array_length == 1");
}

{
  __assert_rtn("create_texture", "jet_context_OpenGL.mm", 380, "depth == 1");
}

void jet_context_OpenGL::begin_render_pass()
{
  __assert_rtn("begin_render_pass", "jet_context_OpenGL.mm", 830, "stencilTexture->is_stencil_attachment_compatible()");
}

{
  __assert_rtn("begin_render_pass", "jet_context_OpenGL.mm", 826, "depthTexture->is_depth_attachment_compatible()");
}

{
  __assert_rtn("begin_render_pass", "jet_context_OpenGL.mm", 822, "colorTexture->is_color_attachment_compatible()");
}

void jet_context_OpenGL::set_vertex_buffer()
{
  __assert_rtn("set_vertex_buffer", "jet_context_OpenGL.mm", 1261, "index >= 0");
}

void jet_context_OpenGL::set_vertex_constant()
{
  __assert_rtn("set_vertex_constant", "jet_context_OpenGL.mm", 1287, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_OpenGL.mm", 1383, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_OpenGL.mm", 1384, "data");
}

void jet_context_OpenGL::set_vertex_texture()
{
  __assert_rtn("set_vertex_texture", "jet_context_OpenGL.mm", 1402, "index >= 0");
}

void jet_context_OpenGL::set_vertex_sampler()
{
  __assert_rtn("set_vertex_sampler", "jet_context_OpenGL.mm", 1424, "index >= 0");
}

void jet_context_OpenGL::draw_indexed()
{
  jet_log(CFSTR("draw_indexed: indexType must be 'unsigned_int' or 'unsigned_short'"));
  __assert_rtn("draw_indexed", "jet_context_OpenGL.mm", 1500, "indexType == jet_component_type_unsigned_int || indexType == jet_component_type_unsigned_short");
}

void jet_buffer_OpenGL::set_data()
{
  __assert_rtn("set_data", "jet_types_OpenGL.h", 1046, "length + offset <= _length");
}

void jet_buffer_OpenGL::commit_data()
{
  __assert_rtn("commit_data", "jet_types_OpenGL.h", 981, "length + offset <= _length");
}

void jet_texture_OpenGL::set_data()
{
  __assert_rtn("set_data", "jet_types_OpenGL.h", 363, "!is_framebuffer_only()");
}

void jet_texture_OpenGL::replace_region()
{
  __assert_rtn("replace_region", "jet_types_OpenGL.h", 411, "!is_framebuffer_only()");
}

void jet_context_Metal::create_texture()
{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 582, "type == jet_texture_type_2D || type == jet_texture_type_Rect");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 580, "data == nullptr");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 579, "mip_mapped == false");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 574, "array_length == 1");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 573, "depth == 1");
}

void jet_context_Metal::create_texture_from_IOSurface()
{
  jet_log(CFSTR("IOSurface bytesPerRow must be a multiple of %d"), 16);
  __assert_rtn("create_texture_from_IOSurface", "jet_context_Metal.mm", 668, "bytesPerRow % JET_IO_SURFACE_MIN_READ_ALIGNMENT == 0");
}

void jet_context_Metal::create_program()
{
  __assert_rtn("create_program", "jet_context_Metal.mm", 849, "vertexFunction");
}

{
  __assert_rtn("create_program", "jet_context_Metal.mm", 850, "fragmentFunction");
}

{
  __assert_rtn("create_program", "jet_context_Metal.mm", 852, "getMetalFunction(vertexFunction)");
}

{
  __assert_rtn("create_program", "jet_context_Metal.mm", 853, "getMetalFunction(fragmentFunction)");
}

void jet_context_Metal::begin_render_pass()
{
  __assert_rtn("begin_render_pass", "jet_context_Metal.mm", 1124, "stencilTexture->is_stencil_attachment_compatible()");
}

{
  __assert_rtn("begin_render_pass", "jet_context_Metal.mm", 1120, "depthTexture->is_depth_attachment_compatible()");
}

{
  __assert_rtn("begin_render_pass", "jet_context_Metal.mm", 1116, "colorTexture->is_color_attachment_compatible()");
}

void jet_context_Metal::set_vertex_buffer()
{
  __assert_rtn("set_vertex_buffer", "jet_context_Metal.mm", 1338, "index >= 0");
}

void jet_context_Metal::set_vertex_constant()
{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1343, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1352, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1353, "data");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1354, "elementCount == 1");
}

void jet_context_Metal::set_vertex_texture()
{
  __assert_rtn("set_vertex_texture", "jet_context_Metal.mm", 1361, "index >= 0");
}

void jet_context_Metal::set_vertex_sampler()
{
  __assert_rtn("set_vertex_sampler", "jet_context_Metal.mm", 1366, "index >= 0");
}

void jet_context_Metal::set_fragment_texture()
{
  __assert_rtn("set_fragment_texture", "jet_context_Metal.mm", 1371, "index >= 0");
}

void jet_context_Metal::set_fragment_sampler()
{
  __assert_rtn("set_fragment_sampler", "jet_context_Metal.mm", 1376, "index >= 0");
}

void jet_context_Metal::set_fragment_constant()
{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1382, "index >= 0");
}

{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1392, "index >= 0");
}

{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1393, "data");
}

{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1394, "elementCount == 1");
}

void jet_context_Metal::draw_indexed()
{
  jet_log(CFSTR("draw_indexed: indexType must be 'unsigned_int' or 'unsigned_short'"));
  __assert_rtn("draw_indexed", "jet_context_Metal.mm", 1421, "indexType == jet_component_type_unsigned_int || indexType == jet_component_type_unsigned_short");
}

void jet_texture_Metal::replace_region()
{
  __assert_rtn("replace_region", "jet_types_Metal.h", 79, "!is_framebuffer_only()");
}

void jet_createSharedContext()
{
  __assert_rtn("jet_createSharedContext", "Jet.mm", 63, "false");
}

void jet_buffer_pool::set_max_buffer_count()
{
  __assert_rtn("set_max_buffer_count", "jet_buffer_pool.mm", 102, "count >= _maxBufferCount");
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D18](*(_QWORD *)&csid);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void NSLogv(NSString *format, va_list args)
{
  MEMORY[0x24BDD1008](format, args);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24D1A3160(__p);
}

uint64_t operator delete()
{
  return off_24D1A3168();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D1A3170(__sz);
}

uint64_t operator new()
{
  return off_24D1A3178();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void glActiveTexture(GLenum texture)
{
  MEMORY[0x24BDE2820](*(_QWORD *)&texture);
}

void glAttachShader(GLuint program, GLuint shader)
{
  MEMORY[0x24BDE2828](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glBindBuffer(GLenum target, GLuint buffer)
{
  MEMORY[0x24BDE2838](*(_QWORD *)&target, *(_QWORD *)&buffer);
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
  MEMORY[0x24BDE2840](*(_QWORD *)&target, *(_QWORD *)&framebuffer);
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
  MEMORY[0x24BDE2848](*(_QWORD *)&target, *(_QWORD *)&renderbuffer);
}

void glBindTexture(GLenum target, GLuint texture)
{
  MEMORY[0x24BDE2850](*(_QWORD *)&target, *(_QWORD *)&texture);
}

void glBlendEquation(GLenum mode)
{
  MEMORY[0x24BDE2860](*(_QWORD *)&mode);
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
  MEMORY[0x24BDE2868](*(_QWORD *)&sfactor, *(_QWORD *)&dfactor);
}

void glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)
{
  MEMORY[0x24BDE2870](*(_QWORD *)&srcRGB, *(_QWORD *)&dstRGB, *(_QWORD *)&srcAlpha, *(_QWORD *)&dstAlpha);
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
  MEMORY[0x24BDE2880](*(_QWORD *)&target, size, data, *(_QWORD *)&usage);
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x24BDE2890](*(_QWORD *)&target);
}

void glClear(GLbitfield mask)
{
  MEMORY[0x24BDE2898](*(_QWORD *)&mask);
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
  MEMORY[0x24BDE28A0](red, green, blue, alpha);
}

void glClearStencil(GLint s)
{
  MEMORY[0x24BDE28A8](*(_QWORD *)&s);
}

uint64_t glClientWaitSyncAPPLE()
{
  return MEMORY[0x24BDE28B0]();
}

void glColorMask(GLBOOLean red, GLBOOLean green, GLBOOLean blue, GLBOOLean alpha)
{
  MEMORY[0x24BDE28B8](red, green, blue, alpha);
}

void glCompileShader(GLuint shader)
{
  MEMORY[0x24BDE28C0](*(_QWORD *)&shader);
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x24BDE28D0]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x24BDE28D8](*(_QWORD *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
  MEMORY[0x24BDE28E0](*(_QWORD *)&n, buffers);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
  MEMORY[0x24BDE28E8](*(_QWORD *)&n, framebuffers);
}

void glDeleteProgram(GLuint program)
{
  MEMORY[0x24BDE28F0](*(_QWORD *)&program);
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
  MEMORY[0x24BDE28F8](*(_QWORD *)&n, renderbuffers);
}

void glDeleteShader(GLuint shader)
{
  MEMORY[0x24BDE2900](*(_QWORD *)&shader);
}

uint64_t glDeleteSyncAPPLE()
{
  return MEMORY[0x24BDE2908]();
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
  MEMORY[0x24BDE2910](*(_QWORD *)&n, textures);
}

void glDepthFunc(GLenum func)
{
  MEMORY[0x24BDE2920](*(_QWORD *)&func);
}

void glDepthMask(GLBOOLean flag)
{
  MEMORY[0x24BDE2928](flag);
}

void glDetachShader(GLuint program, GLuint shader)
{
  MEMORY[0x24BDE2930](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glDisable(GLenum cap)
{
  MEMORY[0x24BDE2938](*(_QWORD *)&cap);
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x24BDE2948]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x24BDE2950](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
  MEMORY[0x24BDE2958](*(_QWORD *)&mode, *(_QWORD *)&count, *(_QWORD *)&type, indices);
}

void glEnable(GLenum cap)
{
  MEMORY[0x24BDE2960](*(_QWORD *)&cap);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x24BDE2968](*(_QWORD *)&index);
}

uint64_t glFenceSyncAPPLE()
{
  return MEMORY[0x24BDE2970]();
}

void glFlush(void)
{
  MEMORY[0x24BDE2980]();
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
  MEMORY[0x24BDE2988](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&renderbuffertarget, *(_QWORD *)&renderbuffer);
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
  MEMORY[0x24BDE2990](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&textarget, *(_QWORD *)&texture, *(_QWORD *)&level);
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
  MEMORY[0x24BDE2998](*(_QWORD *)&n, buffers);
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
  MEMORY[0x24BDE29A0](*(_QWORD *)&n, framebuffers);
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
  MEMORY[0x24BDE29A8](*(_QWORD *)&n, renderbuffers);
}

void glGenTextures(GLsizei n, GLuint *textures)
{
  MEMORY[0x24BDE29B0](*(_QWORD *)&n, textures);
}

void glGenerateMipmap(GLenum target)
{
  MEMORY[0x24BDE29C0](*(_QWORD *)&target);
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE29C8](*(_QWORD *)&program, name);
}

void glGetBooleanv(GLenum pname, GLBOOLean *params)
{
  MEMORY[0x24BDE29D0](*(_QWORD *)&pname, params);
}

GLenum glGetError(void)
{
  return MEMORY[0x24BDE29D8]();
}

void glGetFloatv(GLenum pname, GLfloat *params)
{
  MEMORY[0x24BDE29E0](*(_QWORD *)&pname, params);
}

void glGetFramebufferAttachmentParameteriv(GLenum target, GLenum attachment, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE29E8](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&pname, params);
}

void glGetIntegerv(GLenum pname, GLint *params)
{
  MEMORY[0x24BDE29F0](*(_QWORD *)&pname, params);
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x24BDE29F8](*(_QWORD *)&program, *(_QWORD *)&bufsize, length, infolog);
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A00](*(_QWORD *)&program, *(_QWORD *)&pname, params);
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A08](*(_QWORD *)&target, *(_QWORD *)&pname, params);
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x24BDE2A10](*(_QWORD *)&shader, *(_QWORD *)&bufsize, length, infolog);
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A18](*(_QWORD *)&shader, *(_QWORD *)&pname, params);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE2A30](*(_QWORD *)&program, name);
}

void glGetVertexAttribiv(GLuint index, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A38](*(_QWORD *)&index, *(_QWORD *)&pname, params);
}

void glLinkProgram(GLuint program)
{
  MEMORY[0x24BDE2A48](*(_QWORD *)&program);
}

uint64_t glMapBufferRangeEXT()
{
  return MEMORY[0x24BDE2A58]();
}

void glPixelStorei(GLenum pname, GLint param)
{
  MEMORY[0x24BDE2A60](*(_QWORD *)&pname, *(_QWORD *)&param);
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
  MEMORY[0x24BDE2A78](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&format, *(_QWORD *)&type, pixels);
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2A80](*(_QWORD *)&target, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height);
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2A98](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
  MEMORY[0x24BDE2AA0](*(_QWORD *)&shader, *(_QWORD *)&count, string, length);
}

void glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)
{
  MEMORY[0x24BDE2AA8](*(_QWORD *)&face, *(_QWORD *)&func, *(_QWORD *)&ref, *(_QWORD *)&mask);
}

void glStencilMask(GLuint mask)
{
  MEMORY[0x24BDE2AB0](*(_QWORD *)&mask);
}

void glStencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass)
{
  MEMORY[0x24BDE2AB8](*(_QWORD *)&face, *(_QWORD *)&fail, *(_QWORD *)&zfail, *(_QWORD *)&zpass);
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
  MEMORY[0x24BDE2AC0](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&border, *(_QWORD *)&format, *(_QWORD *)&type);
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
  MEMORY[0x24BDE2AD8](*(_QWORD *)&target, *(_QWORD *)&pname, *(_QWORD *)&param);
}

void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
{
  MEMORY[0x24BDE2AE8](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&xoffset, *(_QWORD *)&yoffset, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&format, *(_QWORD *)&type);
}

void glUniform1f(GLint location, GLfloat x)
{
  MEMORY[0x24BDE2AF0](*(_QWORD *)&location, x);
}

void glUniform1fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2AF8](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform1i(GLint location, GLint x)
{
  MEMORY[0x24BDE2B00](*(_QWORD *)&location, *(_QWORD *)&x);
}

void glUniform1iv(GLint location, GLsizei count, const GLint *v)
{
  MEMORY[0x24BDE2B08](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform2f(GLint location, GLfloat x, GLfloat y)
{
  MEMORY[0x24BDE2B10](*(_QWORD *)&location, x, y);
}

void glUniform2fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2B18](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform2i(GLint location, GLint x, GLint y)
{
  MEMORY[0x24BDE2B20](*(_QWORD *)&location, *(_QWORD *)&x, *(_QWORD *)&y);
}

void glUniform2iv(GLint location, GLsizei count, const GLint *v)
{
  MEMORY[0x24BDE2B28](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
{
  MEMORY[0x24BDE2B30](*(_QWORD *)&location, x, y, z);
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2B38](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform3i(GLint location, GLint x, GLint y, GLint z)
{
  MEMORY[0x24BDE2B40](*(_QWORD *)&location, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&z);
}

void glUniform3iv(GLint location, GLsizei count, const GLint *v)
{
  MEMORY[0x24BDE2B48](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
  MEMORY[0x24BDE2B50](*(_QWORD *)&location, x, y, z, w);
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2B58](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform4i(GLint location, GLint x, GLint y, GLint z, GLint w)
{
  MEMORY[0x24BDE2B60](*(_QWORD *)&location, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&z, *(_QWORD *)&w);
}

void glUniform4iv(GLint location, GLsizei count, const GLint *v)
{
  MEMORY[0x24BDE2B68](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniformMatrix2fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x24BDE2B70](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

void glUniformMatrix3fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x24BDE2B78](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x24BDE2B80](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

uint64_t glUnmapBufferOES()
{
  return MEMORY[0x24BDE2B90]();
}

void glUseProgram(GLuint program)
{
  MEMORY[0x24BDE2B98](*(_QWORD *)&program);
}

void glValidateProgram(GLuint program)
{
  MEMORY[0x24BDE2BA0](*(_QWORD *)&program);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x24BDE2BB8](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2BC0](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

