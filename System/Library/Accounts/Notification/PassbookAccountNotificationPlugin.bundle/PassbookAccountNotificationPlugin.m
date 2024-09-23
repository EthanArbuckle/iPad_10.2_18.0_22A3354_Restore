uint64_t sub_230F4F5AC(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3FD8]))
    v4 = objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  else
    v4 = 0;

  return v4;
}

uint64_t PKLogFacilityTypeGetObject()
{
  return MEMORY[0x24BE6F420]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

