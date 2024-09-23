@implementation CI

uint64_t __CI_ENABLE_METAL_GPU_block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("CI_ENABLE_METAL_GPU");
  if (v0)
    result = atoi(v0);
  else
    result = CI_ENABLE_METAL_GPU::v;
  CI_ENABLE_METAL_GPU::v = result;
  return result;
}

const char *__CI_WORKING_FORMAT_block_invoke()
{
  const char *result;
  const char *v1;
  int v2;

  result = getenv("CI_WORKING_FORMAT");
  if (result)
  {
    v1 = result;
    result = (const char *)strcmp(result, "BGRA8");
    if ((_DWORD)result)
    {
      result = (const char *)strcmp(v1, "RGBA8");
      if ((_DWORD)result)
      {
        result = (const char *)strcmp(v1, "RGBAh");
        if ((_DWORD)result)
        {
          result = (const char *)strcmp(v1, "RGBAf");
          if ((_DWORD)result)
            return result;
          v2 = 2312;
        }
        else
        {
          v2 = 2056;
        }
      }
      else
      {
        v2 = 264;
      }
    }
    else
    {
      v2 = 266;
    }
    CI_WORKING_FORMAT::v = v2;
  }
  return result;
}

size_t __CI_PRINT_TIME_block_invoke()
{
  char *string;
  size_t result;
  FILE **v2;
  char *v3;
  uint64_t i;
  int8x8_t v5;
  FILE *v6;
  char __dst[64];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  string = get_string("CI_PRINT_TIME");
  if (string)
    result = atoi(string);
  else
    result = CI_PRINT_TIME::v;
  CI_PRINT_TIME::v = result;
  if ((_DWORD)result)
  {
    v2 = (FILE **)MEMORY[0x1E0C80C10];
    fwrite("CI_PRINT_TIME options flags:\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    fprintf(*v2, " depth=%d\n", CI_PRINT_TIME::v);
    memset(&__dst[1], 0, 63);
    v3 = CI_PRINT_TIME_has_string("context==");
    if (v3 || (v3 = CI_PRINT_TIME_has_string("context!="), __dst[0] = 0, v3))
    {
      strncpy(__dst, v3 + 9, 0x40uLL);
      for (i = 0; i != 64; i += 8)
      {
        v5 = vceq_s8(*(int8x8_t *)&__dst[i], (int8x8_t)0x2020202020202020);
        if ((v5.i8[0] & 1) != 0)
          __dst[i] = 0;
        if ((v5.i8[1] & 1) != 0)
          __dst[i + 1] = 0;
        if ((v5.i8[2] & 1) != 0)
          __dst[i + 2] = 0;
        if ((v5.i8[3] & 1) != 0)
          __dst[i + 3] = 0;
        if ((v5.i8[4] & 1) != 0)
          __dst[i + 4] = 0;
        if ((v5.i8[5] & 1) != 0)
          __dst[i + 5] = 0;
        if ((v5.i8[6] & 1) != 0)
          __dst[i + 6] = 0;
        if ((v5.i8[7] & 1) != 0)
          __dst[i + 7] = 0;
      }
      v6 = *v2;
      if (v3[7] == 61)
        fprintf(v6, " context==<name|number> (set %s)\n", __dst);
      else
        fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, v6);
      if (v3[7] == 33)
        return fprintf(*v2, " context!=<name|number> (set %s)\n", __dst);
    }
    else
    {
      fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, *v2);
    }
    return fwrite(" context!=<name|number>\n", 0x18uLL, 1uLL, *v2);
  }
  return result;
}

uint64_t __CI_PRINT_TREE_block_invoke()
{
  char *string;
  char *v1;
  uint64_t result;
  FILE **v3;
  const char *v4;
  const char *v5;
  const char *v6;
  FILE *v7;
  const char *v8;
  FILE *v9;
  const char *v10;
  FILE *v11;
  const char *v12;
  FILE *v13;
  const char *v14;
  FILE *v15;
  const char *v16;
  FILE *v17;
  const char *v18;
  char *v19;
  uint64_t i;
  int8x8_t v21;
  FILE *v22;
  FILE *v23;
  char *v24;
  FILE *v25;
  char *v26;
  char v27[64];
  char __str[64];
  char __dst[64];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  string = get_string("CI_PRINT_TREE");
  v1 = string;
  if (string)
    result = atoi(string);
  else
    result = CI_PRINT_TREE::v;
  CI_PRINT_TREE::v = result;
  if (!(_DWORD)result)
    return result;
  v3 = (FILE **)MEMORY[0x1E0C80C10];
  fwrite("CI_PRINT_TREE options flags:\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  if ((CI_PRINT_TREE::v & 1) != 0)
    v4 = "(set)";
  else
    v4 = "";
  fprintf(*v3, "%3d  initial graph %s\n", 1, v4);
  if ((CI_PRINT_TREE::v & 2) != 0)
    v5 = "(set)";
  else
    v5 = "";
  fprintf(*v3, "%3d  optimized graph %s\n", 2, v5);
  if ((CI_PRINT_TREE::v & 4) != 0)
    v6 = "(set)";
  else
    v6 = "";
  fprintf(*v3, "%3d  program graph %s\n", 4, v6);
  v7 = *v3;
  if (strstr(v1, "dump-inputs"))
    v8 = "(set)";
  else
    v8 = "";
  fprintf(v7, " dump-inputs %s\n", v8);
  v9 = *v3;
  if (strstr(v1, "dump-intermediates"))
    v10 = "(set)";
  else
    v10 = "";
  fprintf(v9, " dump-intermediates %s\n", v10);
  v11 = *v3;
  if (strstr(v1, "dump-raw-intermediates"))
    v12 = "(set)";
  else
    v12 = "";
  fprintf(v11, " dump-raw-intermediates %s\n", v12);
  v13 = *v3;
  if (strstr(v1, "dump-bmtl-intermediates"))
    v14 = "(set)";
  else
    v14 = "";
  fprintf(v13, " dump-bmtl-intermediates %s\n", v14);
  v15 = *v3;
  if (strstr(v1, "dump-outputs"))
    v16 = "(set)";
  else
    v16 = "";
  fprintf(v15, " dump-outputs %s\n", v16);
  v17 = *v3;
  if (strstr(v1, "dump-timing"))
    v18 = "(set)";
  else
    v18 = "";
  fprintf(v17, " dump-timing %s\n", v18);
  memset(&__dst[1], 0, 63);
  v19 = CI_PRINT_TREE_has_string("context==");
  if (!v19)
  {
    v19 = CI_PRINT_TREE_has_string("context!=");
    __dst[0] = 0;
    if (!v19)
    {
      fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, *v3);
LABEL_58:
      fwrite(" context!=<name|number>\n", 0x18uLL, 1uLL, *v3);
      goto LABEL_59;
    }
  }
  strncpy(__dst, v19 + 9, 0x40uLL);
  for (i = 0; i != 64; i += 8)
  {
    v21 = vceq_s8(*(int8x8_t *)&__dst[i], (int8x8_t)0x2020202020202020);
    if ((v21.i8[0] & 1) != 0)
      __dst[i] = 0;
    if ((v21.i8[1] & 1) != 0)
      __dst[i + 1] = 0;
    if ((v21.i8[2] & 1) != 0)
      __dst[i + 2] = 0;
    if ((v21.i8[3] & 1) != 0)
      __dst[i + 3] = 0;
    if ((v21.i8[4] & 1) != 0)
      __dst[i + 4] = 0;
    if ((v21.i8[5] & 1) != 0)
      __dst[i + 5] = 0;
    if ((v21.i8[6] & 1) != 0)
      __dst[i + 6] = 0;
    if ((v21.i8[7] & 1) != 0)
      __dst[i + 7] = 0;
  }
  v22 = *v3;
  if (v19[7] == 61)
    fprintf(v22, " context==<name|number> (set %s)\n", __dst);
  else
    fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, v22);
  if (v19[7] != 33)
    goto LABEL_58;
  fprintf(*v3, " context!=<name|number> (set %s)\n", __dst);
LABEL_59:
  if (CI_PRINT_TREE_frame::didCheck != -1)
    dispatch_once(&CI_PRINT_TREE_frame::didCheck, &__block_literal_global_53);
  snprintf(__str, 0x40uLL, "(set frame-%d)", CI_PRINT_TREE_frame::v);
  v23 = *v3;
  if (CI_PRINT_TREE_frame::didCheck != -1)
    dispatch_once(&CI_PRINT_TREE_frame::didCheck, &__block_literal_global_53);
  v24 = __str;
  if (!CI_PRINT_TREE_frame::v)
    v24 = "";
  fprintf(v23, " frame-<number> %s\n", v24);
  if (CI_PRINT_TREE_graphviz::didCheck != -1)
    dispatch_once(&CI_PRINT_TREE_graphviz::didCheck, &__block_literal_global_55);
  snprintf(v27, 0x40uLL, "(set %s)", (const char *)CI_PRINT_TREE_graphviz::v);
  v25 = *v3;
  if (CI_PRINT_TREE_graphviz::didCheck != -1)
    dispatch_once(&CI_PRINT_TREE_graphviz::didCheck, &__block_literal_global_55);
  v26 = v27;
  if (!CI_PRINT_TREE_graphviz::v)
    v26 = "";
  fprintf(v25, " <dot|pdf|png> %s\n", v26);
  return fputc(10, *v3);
}

FILE *__CI_LOG_FILE_block_invoke()
{
  char *string;
  const char *v1;
  char *v2;
  NSObject *v3;
  FILE *result;
  FILE **v5;
  uint8_t buf[4];
  char *v7;
  char __str[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  string = get_string("CI_LOG_FILE");
  if (!string)
  {
LABEL_7:
    result = (FILE *)CI_LOG_FILE::fp;
    if (CI_LOG_FILE::fp)
      return result;
    goto LABEL_8;
  }
  v1 = string;
  if (!strcmp(string, "stderr"))
  {
    v5 = (FILE **)MEMORY[0x1E0C80C10];
LABEL_12:
    result = *v5;
    goto LABEL_13;
  }
  if (!strcmp(v1, "stdout"))
  {
    v5 = (FILE **)MEMORY[0x1E0C80C20];
    goto LABEL_12;
  }
  if (strcmp(v1, "oslog"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    *(_OWORD *)__str = 0u;
    v9 = 0u;
    v2 = CI_TEMP_DIR();
    snprintf(__str, 0xFFuLL, "%s/%s", v2, v1);
    CI_LOG_FILE::fp = (uint64_t)fopen(__str, "a");
    v3 = ci_logger_general();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = __str;
      _os_log_impl(&dword_1921E4000, v3, OS_LOG_TYPE_DEFAULT, "CI_LOG_FILE path: %s", buf, 0xCu);
    }
    goto LABEL_7;
  }
  result = funopen(&CI_LOG_FILE::cookie, 0, (int (__cdecl *)(void *, const char *, int))memstream_write, 0, 0);
LABEL_13:
  CI_LOG_FILE::fp = (uint64_t)result;
  if (!result)
LABEL_8:
    CI_LOG_FILE::fp = *MEMORY[0x1E0C80C10];
  return result;
}

char *__CI_PRINT_TIME_context_block_invoke()
{
  char *result;
  int v1;
  BOOL v2;
  unsigned int v3;
  const char *v4;
  unsigned int v5;
  uint64_t i;
  int8x8_t v7;

  result = CI_PRINT_TIME_has_string("context");
  if (!result)
    return result;
  v1 = result[7];
  if (v1 == 33)
  {
    v2 = 0;
    CI_PRINT_TIME_context::nequal = result[8] == 61;
  }
  else
  {
    v2 = 0;
    CI_PRINT_TIME_context::nequal = 0;
    if (v1 == 61)
      v2 = result[8] == 61;
  }
  CI_PRINT_TIME_context::equal = v2;
  v5 = result[9];
  v4 = result + 9;
  v3 = v5;
  if ((v5 & 0x80000000) != 0)
  {
    result = (char *)__maskrune(v3, 0x100uLL);
    if ((_DWORD)result)
    {
LABEL_8:
      result = strncpy(&CI_PRINT_TIME_context::name, v4, 0x40uLL);
      for (i = 0; i != 64; i += 8)
      {
        v7 = vceq_s8(*(int8x8_t *)&result[i], (int8x8_t)0x2020202020202020);
        if ((v7.i8[0] & 1) != 0)
          result[i] = 0;
        if ((v7.i8[1] & 1) != 0)
          result[i + 1] = 0;
        if ((v7.i8[2] & 1) != 0)
          result[i + 2] = 0;
        if ((v7.i8[3] & 1) != 0)
          result[i + 3] = 0;
        if ((v7.i8[4] & 1) != 0)
          result[i + 4] = 0;
        if ((v7.i8[5] & 1) != 0)
          result[i + 5] = 0;
        if ((v7.i8[6] & 1) != 0)
          result[i + 6] = 0;
        if ((v7.i8[7] & 1) != 0)
          result[i + 7] = 0;
      }
      return result;
    }
  }
  else
  {
    result = (char *)(*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x100);
    if ((_DWORD)result)
      goto LABEL_8;
  }
  if ((*v4 & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *(unsigned __int8 *)v4 + 60) & 0x400) != 0)
  {
    result = (char *)atoi(v4);
    CI_PRINT_TIME_context::v = (int)result;
  }
  return result;
}

char *__CI_PRINT_TREE_context_block_invoke()
{
  char *result;
  int v1;
  BOOL v2;
  unsigned int v3;
  const char *v4;
  unsigned int v5;
  uint64_t i;
  int8x8_t v7;

  result = CI_PRINT_TREE_has_string("context");
  if (!result)
    return result;
  v1 = result[7];
  if (v1 == 33)
  {
    v2 = 0;
    CI_PRINT_TREE_context::nequal = result[8] == 61;
  }
  else
  {
    v2 = 0;
    CI_PRINT_TREE_context::nequal = 0;
    if (v1 == 61)
      v2 = result[8] == 61;
  }
  CI_PRINT_TREE_context::equal = v2;
  v5 = result[9];
  v4 = result + 9;
  v3 = v5;
  if ((v5 & 0x80000000) != 0)
  {
    result = (char *)__maskrune(v3, 0x100uLL);
    if ((_DWORD)result)
    {
LABEL_8:
      result = strncpy(&CI_PRINT_TREE_context::name, v4, 0x40uLL);
      for (i = 0; i != 64; i += 8)
      {
        v7 = vceq_s8(*(int8x8_t *)&result[i], (int8x8_t)0x2020202020202020);
        if ((v7.i8[0] & 1) != 0)
          result[i] = 0;
        if ((v7.i8[1] & 1) != 0)
          result[i + 1] = 0;
        if ((v7.i8[2] & 1) != 0)
          result[i + 2] = 0;
        if ((v7.i8[3] & 1) != 0)
          result[i + 3] = 0;
        if ((v7.i8[4] & 1) != 0)
          result[i + 4] = 0;
        if ((v7.i8[5] & 1) != 0)
          result[i + 5] = 0;
        if ((v7.i8[6] & 1) != 0)
          result[i + 6] = 0;
        if ((v7.i8[7] & 1) != 0)
          result[i + 7] = 0;
      }
      return result;
    }
  }
  else
  {
    result = (char *)(*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x100);
    if ((_DWORD)result)
      goto LABEL_8;
  }
  if ((*v4 & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *(unsigned __int8 *)v4 + 60) & 0x400) != 0)
  {
    result = (char *)atoi(v4);
    CI_PRINT_TREE_context::v = (int)result;
  }
  return result;
}

uint64_t __CI_PRINT_TREE_frame_block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = CI_PRINT_TREE_has_string("frame-");
  if (v0)
    result = atoi(v0 + 6);
  else
    result = CI_PRINT_TREE_frame::v;
  CI_PRINT_TREE_frame::v = result;
  return result;
}

void __CI_PRINT_TREE_graphviz_block_invoke()
{
  const char *v0;

  v0 = (const char *)CI_PRINT_TREE_graphviz::v;
  if (!CI_PRINT_TREE_graphviz::v)
  {
    v0 = "pdf";
    if (!CI_PRINT_TREE_has_string("pdf"))
    {
      v0 = (const char *)CI_PRINT_TREE_graphviz::v;
      if (CI_PRINT_TREE_graphviz::v)
        goto LABEL_8;
      v0 = "png";
      if (CI_PRINT_TREE_has_string("png"))
        goto LABEL_8;
      v0 = (const char *)CI_PRINT_TREE_graphviz::v;
    }
  }
  CI_PRINT_TREE_graphviz::v = (uint64_t)v0;
  if (v0)
    goto LABEL_12;
  v0 = "dot";
  if (CI_PRINT_TREE_has_string("dot"))
    goto LABEL_12;
  v0 = (const char *)CI_PRINT_TREE_graphviz::v;
LABEL_8:
  CI_PRINT_TREE_graphviz::v = (uint64_t)v0;
  if (!v0)
  {
    if (CI_PRINT_TREE_has_string("graphviz"))
      v0 = "dot";
    else
      v0 = (const char *)CI_PRINT_TREE_graphviz::v;
  }
LABEL_12:
  CI_PRINT_TREE_graphviz::v = (uint64_t)v0;
}

uint64_t __CI_PRINT_PROGRAM_block_invoke()
{
  char *string;
  uint64_t result;

  string = get_string("CI_PRINT_PROGRAM");
  if (string)
    result = atoi(string);
  else
    result = CI_PRINT_PROGRAM::v;
  CI_PRINT_PROGRAM::v = result;
  return result;
}

char *__CI_PRINT_PROGRAM_context_block_invoke()
{
  char *result;
  int v1;
  BOOL v2;
  unsigned int v3;
  const char *v4;
  unsigned int v5;
  uint64_t i;
  int8x8_t v7;

  result = get_string("CI_PRINT_PROGRAM");
  if (!result)
    return result;
  result = strstr(result, "context");
  if (!result)
    return result;
  v1 = result[7];
  if (v1 == 33)
  {
    v2 = 0;
    CI_PRINT_PROGRAM_context::nequal = result[8] == 61;
  }
  else
  {
    v2 = 0;
    CI_PRINT_PROGRAM_context::nequal = 0;
    if (v1 == 61)
      v2 = result[8] == 61;
  }
  CI_PRINT_PROGRAM_context::equal = v2;
  v5 = result[9];
  v4 = result + 9;
  v3 = v5;
  if ((v5 & 0x80000000) != 0)
  {
    result = (char *)__maskrune(v3, 0x100uLL);
    if ((_DWORD)result)
    {
LABEL_9:
      result = strncpy(&CI_PRINT_PROGRAM_context::name, v4, 0x40uLL);
      for (i = 0; i != 64; i += 8)
      {
        v7 = vceq_s8(*(int8x8_t *)&result[i], (int8x8_t)0x2020202020202020);
        if ((v7.i8[0] & 1) != 0)
          result[i] = 0;
        if ((v7.i8[1] & 1) != 0)
          result[i + 1] = 0;
        if ((v7.i8[2] & 1) != 0)
          result[i + 2] = 0;
        if ((v7.i8[3] & 1) != 0)
          result[i + 3] = 0;
        if ((v7.i8[4] & 1) != 0)
          result[i + 4] = 0;
        if ((v7.i8[5] & 1) != 0)
          result[i + 5] = 0;
        if ((v7.i8[6] & 1) != 0)
          result[i + 6] = 0;
        if ((v7.i8[7] & 1) != 0)
          result[i + 7] = 0;
      }
      return result;
    }
  }
  else
  {
    result = (char *)(*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x100);
    if ((_DWORD)result)
      goto LABEL_9;
  }
  if ((*v4 & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *(unsigned __int8 *)v4 + 60) & 0x400) != 0)
  {
    result = (char *)atoi(v4);
    CI_PRINT_PROGRAM_context::v = (int)result;
  }
  return result;
}

char *__CI_FORCE_GPU_PRIORITY_block_invoke()
{
  char *result;
  int v1;
  char v2;

  result = getenv("CI_FORCE_GPU_PRIORITY");
  if (result)
  {
    v1 = *result;
    v2 = v1 - 48;
    if ((v1 - 48) <= 0x3E)
    {
      if (((1 << v2) & 0x100000001000001) == 0)
      {
        if (((1 << v2) & 0x1000000010000004) == 0)
        {
          if (((1 << v2) & 0x4000000040000002) == 0)
            return result;
          goto LABEL_10;
        }
        CI_FORCE_GPU_PRIORITY::v = 76;
        if (v1 != 72 && v1 != 104)
        {
          if (v1 != 78)
            return result;
LABEL_10:
          CI_FORCE_GPU_PRIORITY::v = 78;
          if ((v1 | 0x20) != 0x68)
            return result;
        }
      }
      CI_FORCE_GPU_PRIORITY::v = 72;
    }
  }
  return result;
}

const char *__CI_DISABLE_LOADING_ARCHIVES_BY_NAME_block_invoke()
{
  const char *result;

  result = get_string("CI_DISABLE_LOADING_ARCHIVES_BY_NAME");
  if (result)
  {
    result = (const char *)strlcpy(CI_DISABLE_LOADING_ARCHIVES_BY_NAME::archives_name, result, 0x400uLL);
    CI_DISABLE_LOADING_ARCHIVES_BY_NAME::is_set = 1;
  }
  return result;
}

const char *__CI_HARVESTING_SPECIFIC_LIBRARY_LIST_block_invoke()
{
  const char *result;

  result = get_string("CI_HARVESTING_SPECIFIC_LIBRARY_LIST");
  if (result)
  {
    result = (const char *)strlcpy(CI_HARVESTING_SPECIFIC_LIBRARY_LIST::archives_name, result, 0x400uLL);
    CI_HARVESTING_SPECIFIC_LIBRARY_LIST::is_set = 1;
  }
  return result;
}

const char *__CI_HARVEST_PROCESS_NAME_LIST_block_invoke()
{
  const char *result;

  result = get_string("CI_HARVEST_PROCESS_NAME_LIST");
  if (result)
  {
    result = (const char *)strlcpy(CI_HARVEST_PROCESS_NAME_LIST::archives_name, result, 0x400uLL);
    CI_HARVEST_PROCESS_NAME_LIST::is_set = 1;
  }
  return result;
}

const char *__CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH_block_invoke()
{
  const char *result;

  result = getenv("CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH");
  if (result)
  {
    result = (const char *)strlcpy(CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH::harvesting_path, result, 0x80uLL);
    CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH::is_set = 1;
  }
  return result;
}

const char *__CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME_block_invoke()
{
  const char *result;

  result = getenv("CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME");
  if (result)
  {
    result = (const char *)strlcpy(CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME::harvesting_dir, result, 0x80uLL);
    CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME::is_set = 1;
  }
  return result;
}

const __CFArray *__CI_DOCS_DIR_block_invoke()
{
  __CFBundle *MainBundle;
  const __CFArray *result;
  int v2;
  mode_t st_mode;
  stat v4;

  MainBundle = CFBundleGetMainBundle();
  result = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(MainBundle, CFSTR("UIFileSharingEnabled"));
  if (result == (const __CFArray *)*MEMORY[0x1E0C9AE50])
  {
    result = (const __CFArray *)NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    if (result)
    {
      result = (const __CFArray *)CFArrayGetValueAtIndex(result, 0);
      if (result)
      {
        CFStringGetCString((CFStringRef)result, &CI_DOCS_DIR::directory, 256, 0x8000100u);
        v2 = stat(&CI_DOCS_DIR::directory, &v4);
        st_mode = v4.st_mode;
        result = (const __CFArray *)access(&CI_DOCS_DIR::directory, 2);
        if (result | v2 || (st_mode & 0x4000) == 0)
          CI_DOCS_DIR::directory = 0;
      }
    }
  }
  return result;
}

NSString *__CI_TEMP_DIR_block_invoke()
{
  NSString *result;

  result = NSTemporaryDirectory();
  if (result)
    return (NSString *)strlcpy(CI_TEMP_DIR::temporaryDirectory, -[NSString UTF8String](result, "UTF8String"), 0x200uLL);
  return result;
}

size_t __CI_CACHE_PROGRAM_GRAPH_block_invoke()
{
  size_t result;

  CI_CACHE_PROGRAM_GRAPH::v = get_BOOL("CI_CACHE_PROGRAM_GRAPH", 1);
  result = CI_PRINT_TREE_dump_timing();
  if ((_DWORD)result)
  {
    if (CI_CACHE_PROGRAM_GRAPH::v)
    {
      result = fwrite("Program Graph cache disabled when using CI_PRINT_TREE dump_timing\n", 0x42uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      CI_CACHE_PROGRAM_GRAPH::v = 0;
    }
  }
  return result;
}

uint64_t __CI_TRASH_SURFACES_ON_SETVOLATILE_block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("CI_TRASH_SURFACES_ON_SETVOLATILE");
  if (v0)
    result = atoi(v0);
  else
    result = CI_TRASH_SURFACES_ON_SETVOLATILE_v;
  CI_TRASH_SURFACES_ON_SETVOLATILE_v = result;
  return result;
}

@end
