id _containerClassForContentClass(uint64_t a1)
{
  NSObject *v2;
  id result;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      objc_opt_class();
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      container_log_handle_for_category();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      {
        v4 = 134217984;
        v5 = a1;
        _os_log_fault_impl(&dword_21A231000, v2, OS_LOG_TYPE_FAULT, "Invalid container content class %ld", (uint8_t *)&v4, 0xCu);
      }

      result = 0;
      break;
  }
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t container_class_normalized()
{
  return MEMORY[0x24BDADA18]();
}

uint64_t container_copy_info()
{
  return MEMORY[0x24BDADA20]();
}

uint64_t container_copy_info_value_for_key()
{
  return MEMORY[0x24BDADA28]();
}

uint64_t container_copy_path()
{
  return MEMORY[0x24BDADA38]();
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x24BDADA48]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x24BDADA60]();
}

uint64_t container_delete_array_of_containers()
{
  return MEMORY[0x24BDADA70]();
}

uint64_t container_disk_usage()
{
  return MEMORY[0x24BDADA78]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x24BDADA98]();
}

uint64_t container_free_object()
{
  return MEMORY[0x24BDADAA0]();
}

uint64_t container_get_all_with_class_for_current_user()
{
  return MEMORY[0x24BDADAA8]();
}

uint64_t container_get_class()
{
  return MEMORY[0x24BDADAB0]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x24BDADAB8]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x24BDADAC8]();
}

uint64_t container_get_uid()
{
  return MEMORY[0x24BDADAD0]();
}

uint64_t container_get_unique_path_component()
{
  return MEMORY[0x24BDADAD8]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x24BDADAE0]();
}

uint64_t container_log_handle_for_category()
{
  return MEMORY[0x24BDADAE8]();
}

uint64_t container_object_create()
{
  return MEMORY[0x24BDADAF0]();
}

uint64_t container_object_get_class()
{
  return MEMORY[0x24BDADAF8]();
}

uint64_t container_object_get_identifier()
{
  return MEMORY[0x24BDADB00]();
}

uint64_t container_object_get_uuid()
{
  return MEMORY[0x24BDADB08]();
}

uint64_t container_object_set_class()
{
  return MEMORY[0x24BDADB10]();
}

uint64_t container_recreate_structure()
{
  return MEMORY[0x24BDADB88]();
}

uint64_t container_regenerate_uuid()
{
  return MEMORY[0x24BDADB90]();
}

uint64_t container_replace()
{
  return MEMORY[0x24BDADB98]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x24BDADBA0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

