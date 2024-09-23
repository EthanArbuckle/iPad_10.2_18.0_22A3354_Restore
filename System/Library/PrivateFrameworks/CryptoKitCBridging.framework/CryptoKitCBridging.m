uint64_t getDigestSizeForDigestInfo(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16) + 12;
}

uint64_t ccrng_generate_bridge(uint64_t (**a1)(void))
{
  uint64_t result;

  result = (*a1)();
  if ((_DWORD)result)
    abort();
  return result;
}

uint64_t getccec_full_ctx_size(_QWORD *a1)
{
  return (32 * *a1) | 0x10;
}

uint64_t getccec_pub_ctx_size(_QWORD *a1)
{
  return 24 * *a1 + 16;
}

uint64_t SPAKE2CtxSize()
{
  ccspake_cp_256();
  return ccspake_sizeof_ctx();
}

uint64_t SPAKE2Alishaz0Size()
{
  ccspake_cp_256();
  return ccspake_sizeof_w();
}

uint64_t AESLubyRackoffContextSize()
{
  return 40;
}

uint64_t keyIsCompactRepresentable()
{
  id v0;
  id v1;
  uint64_t result;

  v0 = (id)MEMORY[0x1E0C80A78]();
  objc_msgSend(v0, "length");
  v1 = objc_retainAutorelease(v0);
  objc_msgSend(v1, "bytes");

  if (ccec_x963_import_pub())
    return 0;
  result = ccec_validate_pub();
  if ((_DWORD)result)
  {
    MEMORY[0x1E0C80A78]();
    ccn_sub();
    return (int)ccn_cmp() >= 0;
  }
  return result;
}

uint64_t ccss_sizeof_parameters_fix()
{
  return ccss_sizeof_parameters();
}

uint64_t init_ccec_ctx_pub(uint64_t result, _QWORD *a2)
{
  *a2 = result;
  return result;
}

uint64_t init_ccec_ctx_full(uint64_t result, _QWORD *a2)
{
  *a2 = result;
  return result;
}

unint64_t getHMACContextSizeForDigestInfo(uint64_t a1)
{
  return ((*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16) + 19) & 0xFFFFFFFFFFFFFFF8) + *(_QWORD *)(a1 + 8);
}

uint64_t getCMACContextSize()
{
  uint64_t v0;

  v0 = *(_QWORD *)(ccaes_cbc_encrypt_mode() + 8);
  return v0 + *(_QWORD *)ccaes_cbc_encrypt_mode() + 80;
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x1E0CD5E90]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1E0C81880]();
}

uint64_t ccec_affinify()
{
  return MEMORY[0x1E0C81BE8]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1E0C81C30]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1E0C81C38]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1E0C81C40]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C81C68]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1E0C81C70]();
}

uint64_t ccec_full_add()
{
  return MEMORY[0x1E0C81CE0]();
}

uint64_t ccec_full_sub()
{
  return MEMORY[0x1E0C81CE8]();
}

uint64_t ccec_generate_scalar_fips_retry()
{
  return MEMORY[0x1E0C81D10]();
}

uint64_t ccec_mult_blinded()
{
  return MEMORY[0x1E0C81D30]();
}

uint64_t ccec_projectify()
{
  return MEMORY[0x1E0C81D40]();
}

uint64_t ccec_raw_import_priv_only()
{
  return MEMORY[0x1E0C81D48]();
}

uint64_t ccec_raw_import_pub()
{
  return MEMORY[0x1E0C81D50]();
}

uint64_t ccec_validate_pub()
{
  return MEMORY[0x1E0C81DC0]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1E0C81DE0]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1E0C81DE8]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1E0C81DF8]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1E0C81E08]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x1E0C81EC8]();
}

uint64_t ccn_cmp()
{
  return MEMORY[0x1E0C82210]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1E0C82220]();
}

uint64_t ccn_sub()
{
  return MEMORY[0x1E0C82230]();
}

uint64_t ccn_write_uint_padded_ct()
{
  return MEMORY[0x1E0C82260]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccspake_cp_256()
{
  return MEMORY[0x1E0C82438]();
}

uint64_t ccspake_sizeof_ctx()
{
  return MEMORY[0x1E0C82498]();
}

uint64_t ccspake_sizeof_w()
{
  return MEMORY[0x1E0C824A8]();
}

uint64_t ccss_shamir_share_export()
{
  return MEMORY[0x1E0C82530]();
}

uint64_t ccss_shamir_share_import()
{
  return MEMORY[0x1E0C82560]();
}

uint64_t ccss_shamir_share_init()
{
  return MEMORY[0x1E0C82568]();
}

uint64_t ccss_shamir_share_sizeof_y()
{
  return MEMORY[0x1E0C82570]();
}

uint64_t ccss_sizeof_parameters()
{
  return MEMORY[0x1E0C82580]();
}

uint64_t ccss_sizeof_share()
{
  return MEMORY[0x1E0C82590]();
}

uint64_t cczp_add()
{
  return MEMORY[0x1E0C825C0]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1E0C825C8]();
}

uint64_t cczp_inv()
{
  return MEMORY[0x1E0C825D0]();
}

uint64_t cczp_mod()
{
  return MEMORY[0x1E0C825D8]();
}

uint64_t cczp_mul()
{
  return MEMORY[0x1E0C825E0]();
}

uint64_t cczp_n()
{
  return MEMORY[0x1E0C825E8]();
}

uint64_t cczp_sub()
{
  return MEMORY[0x1E0C825F0]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint64_t map_to_curve_sswu()
{
  return MEMORY[0x1E0C83FC8]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

