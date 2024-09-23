@implementation NSItemProvider

uint64_t __95__NSItemProvider_UTType__initWithContentsOfURL_contentType_openInPlace_coordinated_visibility___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
  return 0;
}

uint64_t __93__NSItemProvider_UTType__loadFileRepresentationForContentType_openInPlace_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result + 16))(result, a2, 0, a3);
  return result;
}

@end
