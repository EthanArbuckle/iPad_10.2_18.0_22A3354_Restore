void sub_23101A424(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  const char *v10;
  double v11;
  double v12;
  char v13;
  NSObject *v14;

  v2 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_23101A7C0(a1, v2);

  objc_msgSend_defaultWorkspace(MEMORY[0x24BDC1548], v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (uint64_t *)(a1 + 32);
  v13 = objc_msgSend_openSensitiveURL_withOptions_(v6, v10, v11, v12, v7, v8);

  if ((v13 & 1) == 0)
  {
    v14 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_23101A748(v9, v14);

  }
}

uint64_t sub_23101A738(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_drawAtPoint_, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_23101A748(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_231019000, a2, OS_LOG_TYPE_DEBUG, "Failed to launch to URL %@", (uint8_t *)&v3, 0xCu);
}

void sub_23101A7C0(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_231019000, a2, OS_LOG_TYPE_DEBUG, "Launching with URL %@ and options %@", (uint8_t *)&v4, 0x16u);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

