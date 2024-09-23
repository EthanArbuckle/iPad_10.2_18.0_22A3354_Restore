@implementation ZN22RegistrarClientProcess21CheckProcessAssertionEv

RegistrarClientProcess *___ZN22RegistrarClientProcess21CheckProcessAssertionEv_block_invoke()
{
  RegistrarClientProcess *result;

  result = (RegistrarClientProcess *)BaseOpaqueObject::ResolveOpaqueRef();
  if (result)
  {
    *((_BYTE *)result + 129) = 0;
    return (RegistrarClientProcess *)RegistrarClientProcess::CheckProcessAssertion(result);
  }
  return result;
}

@end
