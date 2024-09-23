@implementation MPModelArtist

void __67__MPModelArtist_ICRadioContentReference__mpc_radioContentReference__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setArtistName:", v2);
  }

}

@end
